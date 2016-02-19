require 'rails_helper'

RSpec.feature 'Editing an existing wine', type: :feature do
  before do
    @user = FactoryGirl.create(:user)
    sign_in(@user)
  end
  
  scenario 'succeeds with valid values' do
    wine = FactoryGirl.create(:wine)
    visit wine_url(wine)
    click_link 'Edit Wine'
    
    expect(current_url).to eq(edit_wine_url(wine))
    
    #since we're pretending we're a user, we don't want to generate random data
    fill_in 'wine_name', with: 'Test Wine - updated'
    click_button 'Update Wine'
    
    expect(current_path).to eq(wine_path(wine))
    expect(page).to have_content('Test Wine - updated')
  end
end