require 'rails_helper'

RSpec.describe 'Note', type: :model do
    before(:each) do
        @note1 = Note.new(rating: 5, tasting_notes: 'This wine is rad.')
    end
    
    it 'should have a rating field' do
        expect(@note1.rating).to eq(5)
    end
    
    it 'should have a tasting notes field' do
        expect(@note1.tasting_notes).to eq('This wine is rad.')
    end
end