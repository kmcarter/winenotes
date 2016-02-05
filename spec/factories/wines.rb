FactoryGirl.define do
    varietals = ['Shiraz', 'Shirah', 'Chardonnay', 'Pinot Noir', 'Cabernet Sauvignon', 
        'White Zinfindel', 'Sauvignon Blanc', 'Riesling', 'Moscato', 'Merlot', 'Zinfindel', 'Malbec']
    factory :wine do
        name        { Faker::App.name }
        varietal    { varietals.sample }
        year        { Faker::Base.rand_in_range(1900,2016) }
        vinyard     { Faker::Company.name }
    end
end