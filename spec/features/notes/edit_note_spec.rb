require 'rails_helper'

RSpec.feature 'Editing an existing note', type: :feature do
    scenario 'succeeds with valid values' do
        note = FactoryGirl.create(:note)
        visit edit_wine_note_url(note.wine, note)
        
        expect(current_path).to eq(edit_wine_note_path(note.wine, note))
        
        #since we're pretending we're a user, we don't want to generate random data
        fill_in 'note_rating', with: '5'
        fill_in 'note_tasting_notes', with: 'This wine was great. I edited it.'
        click_button 'Update Note'
        
        expect(current_path).to eq(wine_path(note.wine))
        expect(page).to have_content('This wine was great. I edited it.')
    end
end