require 'rails_helper'

RSpec.feature 'Listing all notes' do
    scenario 'returns a message when there are no notes to view' do
        visit '/'
        click_link 'Notes'
        expect(page.current_url).to eq(notes_url)
        expect(page).to have_content('0 notes')
    end
end

RSpec.feature 'Listing all wines' do
    scenario 'returns a message when there are no wines to view' do
        visit '/'
        click_link 'Wines'
        expect(page.current_url).to eq(wines_url)
        expect(page).to have_content('0 wines')
    end
end