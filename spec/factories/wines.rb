FactoryGirl.define do
    factory :wine do
        name        { Faker::App.name }
        varietal    { WinesController::VARIETALS.sample }
        year        { Faker::Base.rand_in_range(1900,2016) }
        vinyard     { Faker::Company.name }
    end
end