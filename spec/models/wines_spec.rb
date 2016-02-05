require 'rails_helper'

RSpec.describe Wine, type: :model do
    before(:all) do
        @wine1 = FactoryGirl.build(:wine)
    end
    
    it 'has a valid factory' do
        expect(@wine1).to be_valid
    end
    
    it { is_expected.to have_db_column(:name) }
    it { is_expected.to have_db_column(:varietal) }
    it { is_expected.to have_db_column(:year) }
    it { is_expected.to have_db_column(:vinyard) }
end