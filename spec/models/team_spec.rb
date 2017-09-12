require 'rails_helper'

RSpec.describe Team, type: :model do

  context 'with a single team' do
    before(:each) do
      @team = Team.create(name: "New England Patriots")
    end

    describe 'validations' do
      it { should validate_presence_of(:name) }
    end
    describe 'associations' do
      it { should have_many(:players) }
    end
  end
end
