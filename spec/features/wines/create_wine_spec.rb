require 'rails_helper'

RSpec.feature 'Creating a new wine', type: :feature do
    scenario 'succeeds with valid values' do
        visit '/wines'
        click_link 'New Wine'
        
        expect(current_url).to eq(new_wine_url)
        
        #since we're pretending we're a user, we don't want to generate random data
        fill_in 'wine_name', with: 'Test Wine'
        select 'Chardonnay', from: 'wine_varietal'
        select '2015', from: 'wine_year'
        fill_in 'wine_vinyard', with: 'Test Vinyard'
        click_button 'Create Wine'
        
        expect(current_path).to eq(wine_path(Wine.last))
        expect(page).to have_content('Test Wine')
        expect(page).to have_content('Wine successfully created.')
    end
end