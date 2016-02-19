require 'rails_helper'

RSpec.feature 'Listing all of a wine\'s notes', type: :feature do
    scenario 'returns a message when there are no notes to view' do
        Wine.destroy_all
        wine = FactoryGirl.create(:wine)
        visit wine_url(wine)
        expect(current_url).to eq(wine_url(wine))
        expect(page).to have_content('0 notes')
    end
    
    scenario 'displays the notes' do
        note = FactoryGirl.create(:note)
        visit wine_url(note.wine)
        expect(current_url).to eq(wine_url(note.wine))
        expect(page).to have_content("#{"note".pluralize(note.wine.notes.count)}")
    end
end