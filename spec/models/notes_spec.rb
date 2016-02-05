require 'rails_helper'

RSpec.describe Note, type: :model do
    before(:all) do
        @note1 = FactoryGirl.build(:note)
    end
    
    it 'has a valid factory' do
        expect(@note1).to be_valid
    end
    
    it { is_expected.to have_db_column(:rating) }
    it { is_expected.to have_db_column(:tasting_notes) }
    
    it { is_expected.to validate_presence_of(:rating) }
end