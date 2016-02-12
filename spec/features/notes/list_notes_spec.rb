require 'rails_helper'

RSpec.feature 'Listing all of a wine\'s notes', type: :feature do
    scenario 'returns a message when there are no notes to view' do
        wine = Wine.all.sample
        visit wine_url(wine)
        expect(current_url).to eq(wine_url(wine))
        expect(page).to have_content('0 notes')
    end
    
    scenario 'displays the notes' do
        wine = Wine.all.sample
        visit wine_url(wine)
        expect(current_url).to eq(wine_url(wine))
        #TODO: figure out how to use pluralize
        expect(page).to have_content("#{wine.notes.count} notes")
    end
end