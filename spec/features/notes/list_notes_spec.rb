require 'rails_helper'

RSpec.feature 'Listing all notes', type: :feature do
    scenario 'returns a message when there are no notes to view' do
        visit '/'
        click_link 'Wines'
        expect(current_url).to eq(wines_url)
        expect(page).to have_content('0 notes')
    end
    
    scenario 'displays the notes' do
        note1 = Note.create!(rating: 5, tasting_notes: 'This wine was excellent.')
        note2 = Note.create!(rating: 3, tasting_notes: 'This wine was okay.')
        note3 = Note.create!(rating: 1, tasting_notes: 'Gross.')
        
        visit '/'
        click_link 'Wines'
        expect(current_url).to eq(wines_url)
        expect(page).to have_content('3 notes')
        expect(page).to have_content(note1.rating)
        expect(page).to have_content(note1.tasting_notes)
        expect(page).to have_content(note2.rating)
        expect(page).to have_content(note2.tasting_notes)
        expect(page).to have_content(note3.rating)
        expect(page).to have_content(note3.tasting_notes)
    end
end