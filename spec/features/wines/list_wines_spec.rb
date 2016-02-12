require 'rails_helper'

RSpec.feature 'Listing all wines', type: :feature do
    scenario 'returns a message when there are no wines to view' do
        visit '/'
        click_link 'Wines'
        expect(page.current_url).to eq(wines_url)
        expect(page).to have_content('0 wines')
    end
    
    scenario 'displays the wines' do
        visit '/'
        click_link 'Wines'
        expect(current_url).to eq(wines_url)
    end
end