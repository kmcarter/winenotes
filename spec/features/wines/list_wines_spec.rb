require 'rails_helper'

RSpec.feature 'Listing all wines', type: :feature do
    scenario 'returns a message when there are no wines to view' do
        visit '/'
        click_link 'Wines'
        expect(page.current_url).to eq(wines_url)
        expect(page).to have_content('0 wines')
    end
    
    scenario 'displays the wines' do
        wine1 = Wine.create!(name: 'Rasmussen', varietal: 'Chardonnay', year: 2014, vinyard: 'Steve Rasmussen Santa Barbara')
        wine2 = Wine.create!(name: 'Angels Reserve', varietal: 'Shiraz', year: 2014, vinyard: 'F. Stephen Millier')
        wine3 = Wine.create!(name: 'Janus', varietal: 'Pinot Grigio', year: 2014, vinyard: 'Sacchetto')
        
        visit '/'
        click_link 'Wines'
        expect(current_url).to eq(wines_url)
        expect(page).to have_content('3 wines')
        expect(page).to have_content(wine1.name)
        expect(page).to have_content(wine1.varietal)
        expect(page).to have_content(wine1.year)
        expect(page).to have_content(wine1.vinyard)
    end
end