require 'rails_helper'

RSpec.describe User, type: :model do
  context 'with a single user' do
    describe 'validations' do
      it { should validate_presence_of(:first_name) }
      it { should validate_presence_of(:last_name) }
      it { should validate_numericality_of(:age) }
    end
  end
end
