require 'rails_helper'

RSpec.describe Player, type: :model do
  before(:each) do
    @team = Team.create(name: "New England Patriots")
    @player = Player.create(first_name: "Tom", last_name: "Brady", position: "QB", team: @team)
  end

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:position) }
    it { should validate_inclusion_of(:position).in_array(
      ['QB', 'RB', 'FB', 'WR', 'TE', 'T', 'G', 'C', 'DE', 'DT', 'LB', 'S', 'CB'])}
  end

  describe 'associations' do
    it { should belong_to(:team) }
  end

  describe '#sortable_name' do
    it 'returns name last, first' do
      expect(@player.sortable_name).to eq("#{@player.last_name}, #{@player.first_name}")      
    end
  end

  describe '#display_name' do
    it 'returns first_name last_name' do
      expect(@player.display_name).to eq("#{@player.first_name} #{@player.last_name}")      
    end
  end

end
