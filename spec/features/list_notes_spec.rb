require 'rails_helper'

RSpec.feature 'Listing all notes' do
    scenario 'returns a message when there are no notes to view' do
        visit '/'
        click_link 'Notes'
        expect(page.current_url).to eq(notes_url)
        expect(page).to have_content('0 notes')
    end
end