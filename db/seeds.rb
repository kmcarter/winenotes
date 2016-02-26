# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Wine.destroy_all

100.times do
  Wine.create(
    name: Faker::App.name,
    varietal: WinesController::VARIETALS.sample,
    year: Faker::Base.rand_in_range(1900,2016),
    vinyard: Faker::Company.name
  )
end