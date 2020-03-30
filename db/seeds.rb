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
ContactChannel.create! name: ContactChannel::WEBSITE, label: "www.bighornbistro.com", value: "https://www.bighornbistro.com", vendor: vendor
ContactChannel.create! name: ContactChannel::WHATSAPP, label: "07 89 07 79 62", value: "https://web.whatsapp.com/send?phone=33789077962&text=Hello, i'd like to make a reservation", vendor: vendor
%w[Thursday Friday Saturday Sunday].each do |day|
  WeekdayTimeRange.create! day: day, start_in_mins: 17*60, end_in_mins: 21*60, vendor: vendor
end
p "Seeded #{vendor.name}"

location = Location.create! street: "67 Promenade Marie Paradis",
                            town: "Chamonix",
                            latitude: "45.919216",
                            longitude: "6.867719"
vendor = Vendor.create! name: 'The Dainty Pizza',
                        delivers: true,
                        location: location
ContactChannel.create! name: ContactChannel::WEBSITE, label: "www.thedaintypizza.com", value: "https://www.thedaintypizza.com", vendor: vendor
ContactChannel.create! name: ContactChannel::TELEPHONE, label: "04 50 96 73 59", value: "tel:0450967359", vendor: vendor
%w[Wednesday Thursday Friday Saturday Sunday].each do |day|
  WeekdayTimeRange.create! day: day, start_in_mins: 18*60, end_in_mins: 23*60, vendor: vendor
end
p "Seeded #{vendor.name}"

location = Location.create! street: "34 Rue du Docteur Paccard",
                            town: "Chamonix",
                            latitude: "45.9227033",
                            longitude: "6.8691504"
vendor = Vendor.create! name: 'La Maison du Burger',
                        delivers: false,
                        location: location
ContactChannel.create! name: ContactChannel::FACEBOOK, label: "Facebook", value: "https://www.facebook.com/LMBchamonix/", vendor: vendor
ContactChannel.create! name: ContactChannel::TELEPHONE, label: "09 62 24 87 10", value: "tel:0962248710", vendor: vendor
%w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday].each do |day|
  WeekdayTimeRange.create! day: day, start_in_mins: 10*60, end_in_mins: 18*60, vendor: vendor
end
p "Seeded #{vendor.name}"

location = Location.create! street: "416 Rue Joseph Vallot",
                            town: "Chamonix",
                            latitude: "45.9270337",
                            longitude: "6.8698641"
vendor = Vendor.create! name: 'Hibou Deli',
                        delivers: true,
                        location: location
ContactChannel.create! name: ContactChannel::FACEBOOK, label: "Facebook", value: "https://www.facebook.com/HIBOUDELI/", vendor: vendor
ContactChannel.create! name: ContactChannel::WEBSITE, label: "www.hibou-chamonix.com", value: "https://www.hibou-chamonix.com/", vendor: vendor
ContactChannel.create! name: ContactChannel::EMAIL, label: "hibouchamonix@gmail.com", value: "mainto:hibouchamonix@gmail.com", vendor: vendor
ContactChannel.create! name: ContactChannel::TELEPHONE, label: "06 48 43 05 20", value: "tel:0648430520", vendor: vendor
%w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday].each do |day|
  WeekdayTimeRange.create! day: day, start_in_mins: 11*60, end_in_mins: 13*60, vendor: vendor
end
p "Seeded #{vendor.name}"

location = Location.create! street: "62, Avenue Ravanel Le Rouge",
                            town: "Chamonix",
                            latitude: "45.9201391",
                            longitude: "6.8663457"
vendor = Vendor.create! name: 'Annapurna',
                        delivers: false,
                        location: location
ContactChannel.create! name: ContactChannel::FACEBOOK, label: "Facebook", value: "https://www.facebook.com/annapurna.restaurant.chamonix/", vendor: vendor
ContactChannel.create! name: ContactChannel::WEBSITE, label: "www.annapurna-chamonix.com", value: "http://www.annapurna-chamonix.com/", vendor: vendor
ContactChannel.create! name: ContactChannel::TELEPHONE, label: "04 50 55 81 39", value: "tel:0450558139", vendor: vendor
%w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday].each do |day|
  WeekdayTimeRange.create! day: day, start_in_mins: 11*60+30, end_in_mins: 14*60+30, vendor: vendor
  WeekdayTimeRange.create! day: day, start_in_mins: 18*60, end_in_mins: 23*60, vendor: vendor
end
p "Seeded #{vendor.name}"

location = Location.create! street: "215 Avenue Michel Croz",
                            town: "Chamonix",
                            latitude: "45.9231586",
                            longitude: "6.8704148"
vendor = Vendor.create! name: 'Thai To Go Chamonix',
                        delivers: true,
                        location: location
ContactChannel.create! name: ContactChannel::FACEBOOK, label: "Facebook", value: "https://www.facebook.com/ThaiToGoChamonix/", vendor: vendor
ContactChannel.create! name: ContactChannel::TELEPHONE, label: "09 53 09 52 80", value: "tel:0953095280", vendor: vendor
%w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday].each do |day|
  WeekdayTimeRange.create! day: day, start_in_mins: 10*60, end_in_mins: 22*60, vendor: vendor
end
p "Seeded #{vendor.name}"


location = Location.create! street: "77 Pl. de la Fruitière",
                            town: "Les Houches",
                            latitude: "45.8893722",
                            longitude: "6.7864525"
vendor = Vendor.create! name: 'Kitsch Inn',
                        delivers: true,
                        location: location
ContactChannel.create! name: ContactChannel::WEBSITE, label: "www.kitschinn.fr", value: "https://www.kitschinn.fr/", vendor: vendor
ContactChannel.create! name: ContactChannel::TELEPHONE, label: "04 50 34 41 74", value: "tel:0450344174", vendor: vendor
%w[Monday Tuesday Wednesday Thursday Friday].each do |day|
  WeekdayTimeRange.create! day: day, start_in_mins: 16*60+30, end_in_mins: 20*60, vendor: vendor
end
%w[Saturday Sunday].each do |day|
  WeekdayTimeRange.create! day: day, start_in_mins: 13*60, end_in_mins: 20*60, vendor: vendor
end
p "Seeded #{vendor.name}"


location = Location.create! street: "414 rue Joseph Vallot",
                            town: "Chamonix",
                            latitude: "45.9269499",
                            longitude: "6.8680867"
vendor = Vendor.create! name: 'Pizzas la Roulotte',
                        delivers: true,
                        location: location
ContactChannel.create! name: ContactChannel::WEBSITE, label: "www.pizzaslaroulotte-chamonix.com", value: "https://www.pizzaslaroulotte-chamonix.com/", vendor: vendor
ContactChannel.create! name: ContactChannel::TELEPHONE, label: "06 59 56 62 38", value: "tel:0659566238", vendor: vendor
ContactChannel.create! name: ContactChannel::EMAIL, label: "pizza.laroulotte@gmail.com", value: "mailto:pizza.laroulotte@gmail.com", vendor: vendor
%w[Monday Tuesday Friday Saturday Sunday].each do |day|
  WeekdayTimeRange.create! day: day, start_in_mins: 12*60, end_in_mins: 14*60, vendor: vendor
  WeekdayTimeRange.create! day: day, start_in_mins: 18*60, end_in_mins: 21*60, vendor: vendor
end
p "Seeded #{vendor.name}"


location = Location.create! street: "Rue de l'Église",
                            town: "Les Houches",
                            latitude: "45.8910114",
                            longitude: "6.7965492"
vendor = Vendor.create! name: 'Le Délice',
                        delivers: true,
                        location: location
ContactChannel.create! name: ContactChannel::WEBSITE, label: "www.le-delice.info", value: "https://www.le-delice.info/", vendor: vendor
ContactChannel.create! name: ContactChannel::TELEPHONE, label: "07 85 50 86 52", value: "tel:0785508652", vendor: vendor
ContactChannel.create! name: ContactChannel::TELEPHONE, label: "04 50 91 52 06", value: "tel:0450915206", vendor: vendor
ContactChannel.create! name: ContactChannel::EMAIL, label: "ledelicechamonix@gmail.com", value: "mailto:ledelicechamonix@gmail.com", vendor: vendor
%w[Friday Saturday Sunday].each do |day|
  WeekdayTimeRange.create! day: day, start_in_mins: 12*60, end_in_mins: 18*60, vendor: vendor
end
p "Seeded #{vendor.name}"
