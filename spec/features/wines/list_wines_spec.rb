require 'rails_helper'

RSpec.feature 'Listing all wines', type: :feature do
  before do
    @user = FactoryGirl.create(:user)
    sign_in(@user)
  end
  
  scenario 'returns a message when there are no wines to view' do
    Wine.destroy_all
    visit '/'
    click_link 'Wines'
    expect(page.current_url).to eq(wines_url)
    expect(page).to have_content('0 wines')
  end
  
  scenario 'displays the wines' do
    visit '/'
    click_link 'Wines'
    expect(current_url).to eq(wines_url)
    expect(page).to have_content("#{"wine".pluralize(Wine.all.count)}")
  end
end