FactoryGirl.define do
    factory :note do
        rating          { (0..5).to_a.sample }
        tasting_notes   { Faker::Lorem.paragraph }
        wine
    end
end