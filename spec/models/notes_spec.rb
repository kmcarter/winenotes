require 'rails_helper'

RSpec.describe 'Note', type: :model do
    before(:all) do
        @note1 = FactoryGirl.build(:note)
    end
    
    it 'has a valid factory' do
        expect(@note1).to be_valid
    end
    
    it 'should have a rating field' do
        expect(@note1.rating).to eq(5)
    end
    
    it 'should have a tasting notes field' do
        expect(@note1.tasting_notes).to eq('This wine is rad.')
    end
end