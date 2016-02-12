require 'rails_helper'

RSpec.feature 'Creating a new note', type: :feature do
    scenario 'saves the note if it is valid and displays it on the wine page' do
        wine = FactoryGirl.create(:wine)
        
        visit wine_url(wine)
        click_link 'Add Note'
        
        expect(current_path).to eq(new_wine_note_path(wine))
        
        #since we're pretending we're a user, we don't want to generate random data
        fill_in 'note_rating', with: '3'
        fill_in 'note_tasting_notes', with: 'This wine was great'
        click_button 'Create Note'
        
        expect(current_path).to eq(wine_note_path(wine, Note.last))
        expect(page).to have_content('This wine was great')
        expect(page).to have_content('Note successfully created.')
    end
    
    # scenario 'fails if the rating is not provided' do
    #     visit '/notes'
    #     click_link 'New Note'
        
    #     expect(current_url).to eq(new_note_url)
        
    #     click_button 'Create Note'
        
    #     expect(current_path).to eq(new_note_path)
    #     expect(page).to have_content('error')
    # end
end