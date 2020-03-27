# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
Vendor.destroy_all
Location.destroy_all

location = Location.create! street: "77 Place Edmond Desailloud",
                            town: "Chamonix",
                            latitude: "45.9189243",
                            longitude: "6.8676844"
vendor = Vendor.create! name: 'Bighorn Bistro & Bakery',
                        delivers: false,
                        location: location
%w[Monday Friday Saturday Sunday].each do |day|
  WeekdayTimeRange.create! day: day, start_in_mins: 12*60, end_in_mins: 20*60, vendor: vendor
end
p "Seeded #{vendor.name}"

location = Location.create! street: "67 Promenade Marie Paradis",
                            town: "Chamonix",
                            latitude: "45.919216",
                            longitude: "6.867719"
vendor = Vendor.create! name: 'The Dainty Pizza',
                        delivers: true,
                        location: location
%w[Wednesday Thursday Friday Saturday Sunday].each do |day|
  WeekdayTimeRange.create! day: day, start_in_mins: 18*60, end_in_mins: 22*60, vendor: vendor
end
p "Seeded #{vendor.name}"

location = Location.create! street: "34 Rue du Docteur Paccard",
                            town: "Chamonix",
                            latitude: "45.9227033",
                            longitude: "6.8691504"
vendor = Vendor.create! name: 'La Maison du Burger',
                        delivers: false,
                        location: location
p "Seeded #{vendor.name}"

location = Location.create! street: "416 Rue Joseph Vallot",
                            town: "Chamonix",
                            latitude: "45.9270337",
                            longitude: "6.8698641"
vendor = Vendor.create! name: 'Hibou Deli',
                        delivers: false,
                        location: location
p "Seeded #{vendor.name}"
  
