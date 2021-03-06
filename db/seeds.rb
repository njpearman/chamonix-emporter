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
                        delivers: true,
                        location: location
ContactChannel.create! name: ContactChannel::WEBSITE, label: "www.bighornbistro.com", value: "https://www.bighornbistro.com", vendor: vendor
ContactChannel.create! name: ContactChannel::FACEBOOK, label: "bighornbistro", value: "https://www.facebook.com/bighornbistro/", vendor: vendor
ContactChannel.create! name: ContactChannel::WHATSAPP, label: "07 89 07 79 62", value: "https://web.whatsapp.com/send?phone=33789077962&text=Hello, i'd like to make a reservation", vendor: vendor
ContactChannel.create! name: ContactChannel::WEBSITE, label: "Cham at home", value: "https://www.chamathome.com/bighorn", vendor: vendor
%w[Thursday Friday Saturday Sunday].each do |day|
  WeekdayTimeRange.create! day: day, start_in_mins: 16*60, end_in_mins: 20*60, vendor: vendor
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
ContactChannel.create! name: ContactChannel::FACEBOOK, label: "thedainty", value: "https://www.facebook.com/thedainty/", vendor: vendor
ContactChannel.create! name: ContactChannel::TELEPHONE, label: "04 50 96 73 59", value: "tel:0450967359", vendor: vendor
%w[Wednesday Thursday Friday Saturday Sunday].each do |day|
  WeekdayTimeRange.create! day: day, start_in_mins: 18*60, end_in_mins: 23*60, vendor: vendor
end
p "Seeded #{vendor.name}"


location = Location.create! street: "269 Avenue de Courmayeur",
                            town: "Chamonix",
                            latitude: "45.9172788",
                            longitude: "6.8676986"
vendor = Vendor.create! name: 'Little Boxes',
                        delivers: true,
                        location: location,
                        information: "Delivers: Argentière - Les Houches"
ContactChannel.create! name: ContactChannel::WEBSITE, label: "Cham at home", value: "https://www.chamathome.com", vendor: vendor
ContactChannel.create! name: ContactChannel::FACEBOOK, label: "Facebook", value: "https://www.facebook.com/jamalchx/", vendor: vendor
ContactChannel.create! name: ContactChannel::TELEPHONE, label: "04 50 93 48 36", value: "tel:0450934836", vendor: vendor
%w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday].each do |day|
  WeekdayTimeRange.create! day: day, start_in_mins: 12*60, end_in_mins: 21*60, vendor: vendor
end
p "Seeded #{vendor.name}"


location = Location.create! street: "34 Rue du Docteur Paccard",
                            town: "Chamonix",
                            latitude: "45.9227033",
                            longitude: "6.8691504"
vendor = Vendor.create! name: 'La Maison du Burger',
                        delivers: false,
                        location: location
ContactChannel.create! name: ContactChannel::FACEBOOK, label: "LMBchamonix", value: "https://www.facebook.com/LMBchamonix/", vendor: vendor
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
ContactChannel.create! name: ContactChannel::FACEBOOK, label: "HibouDeli", value: "https://www.facebook.com/HIBOUDELI/", vendor: vendor
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
                        delivers: true,
                        location: location
ContactChannel.create! name: ContactChannel::WEBSITE, label: "www.annapurna-chamonix.com", value: "http://www.annapurna-chamonix.com/", vendor: vendor
ContactChannel.create! name: ContactChannel::FACEBOOK, label: "1: annapurna.restaurant.chamonix", value: "https://www.facebook.com/annapurna.restaurant.chamonix/", vendor: vendor
ContactChannel.create! name: ContactChannel::FACEBOOK, label: "2: annapurna2grill", value: "https://www.facebook.com/annapurna2grill/", vendor: vendor
ContactChannel.create! name: ContactChannel::TELEPHONE, label: "1: 04 50 55 81 39", value: "tel:0450558139", vendor: vendor
ContactChannel.create! name: ContactChannel::TELEPHONE, label: "2: 06 28 51 76 03", value: "tel:0628517603", vendor: vendor
ContactChannel.create! name: ContactChannel::WEBSITE, label: "Cham at home", value: "https://www.chamathome.com/anapurna", vendor: vendor
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
ContactChannel.create! name: ContactChannel::FACEBOOK, label: "ThaiToGoChamonix", value: "https://www.facebook.com/ThaiToGoChamonix/", vendor: vendor
ContactChannel.create! name: ContactChannel::TELEPHONE, label: "09 53 09 52 80", value: "tel:0953095280", vendor: vendor
ContactChannel.create! name: ContactChannel::WEBSITE, label: "Cham at home", value: "https://www.chamathome.com/thai", vendor: vendor
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
                        location: location,
                        information: "Home deliveries only."
ContactChannel.create! name: ContactChannel::WEBSITE, label: "www.kitschinn.fr", value: "https://www.kitschinn.fr/", vendor: vendor
ContactChannel.create! name: ContactChannel::TELEPHONE, label: "04 50 34 41 74", value: "tel:0450344174", vendor: vendor
%w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday].each do |day|
  WeekdayTimeRange.create! day: day, start_in_mins: 16*60+30, end_in_mins: 20*60+30, vendor: vendor
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
                        location: location,
                        information: "Pick up 16:00-19:00 | Delivery 19:00-20:00"
ContactChannel.create! name: ContactChannel::WEBSITE, label: "www.le-delice.info", value: "https://www.le-delice.info/", vendor: vendor
ContactChannel.create! name: ContactChannel::TELEPHONE, label: "07 85 50 86 52", value: "tel:0785508652", vendor: vendor
# ContactChannel.create! name: ContactChannel::TELEPHONE, label: "04 50 91 52 06", value: "tel:0450915206", vendor: vendor
ContactChannel.create! name: ContactChannel::EMAIL, label: "ledelicechamonix@gmail.com", value: "mailto:ledelicechamonix@gmail.com", vendor: vendor
%w[Friday Saturday Sunday].each do |day|
  WeekdayTimeRange.create! day: day, start_in_mins: 16*60, end_in_mins: 20*60, vendor: vendor
end
p "Seeded #{vendor.name}"


location = Location.create! street: "87 rue des moulins",
                            town: "Chamonix",
                            latitude: "45.92443",
                            longitude: "6.87045"
vendor = Vendor.create! name: 'Munchie',
                        delivers: false,
                        location: location,
                        information: "Order: 4pm | Pick up: 6-8pm"
ContactChannel.create! name: ContactChannel::WEBSITE, label: "www.munchie.fr", value: "http://www.munchie.fr/", vendor: vendor
ContactChannel.create! name: ContactChannel::FACEBOOK, label: "MunchieCuisineEtBar", value: "https://www.facebook.com/MunchieCuisineEtBar/", vendor: vendor
ContactChannel.create! name: ContactChannel::TELEPHONE, label: "04 50 53 45 41", value: "tel:0450534541", vendor: vendor
%w[Thursday Friday Saturday Sunday].each do |day|
  WeekdayTimeRange.create! day: day, start_in_mins: 16*60, end_in_mins: 21*60, vendor: vendor
end
p "Seeded #{vendor.name}"


location = Location.create! street: "129 Route de Taconnaz",
                            town: "Les Houches",
                            latitude: "45.8970978",
                            longitude: "6.8224897"
vendor = Vendor.create! name: 'Artisan sushi',
                        delivers: true,
                        location: location,
                        information: "Delivery: Les Praz - Les Houches
                        Order before 12pm. One delivery tour 5-8pm."
ContactChannel.create! name: ContactChannel::WEBSITE, label: "www.artisansushi.com", value: "http://www.artisansushi.com/", vendor: vendor
ContactChannel.create! name: ContactChannel::FACEBOOK, label: "artisansushichamonix", value: "https://www.facebook.com/artisansushichamonix", vendor: vendor
ContactChannel.create! name: ContactChannel::TELEPHONE, label: "06 56 70 71 08", value: "tel:0656707108", vendor: vendor
%w[Friday Saturday].each do |day|
  WeekdayTimeRange.create! day: day, start_in_mins: 17*60, end_in_mins: 20*60, vendor: vendor
end
p "Seeded #{vendor.name}"


location = Location.create! street: "288 rue josephe vallot",
                            town: "Chamonix",
                            latitude: "45.927218",
                            longitude: "6.870148"
vendor = Vendor.create! name: 'Satsuki',
                        delivers: false,
                        location: location
ContactChannel.create! name: ContactChannel::WEBSITE, label: "www.rakuichi.eu", value: "https://www.rakuichi.eu/", vendor: vendor
ContactChannel.create! name: ContactChannel::FACEBOOK, label: "satsuki.chamonix", value: "https://www.facebook.com/satsuki.chamonix/", vendor: vendor
ContactChannel.create! name: ContactChannel::TELEPHONE, label: "09 63 51 81 80", value: "tel:0963518180", vendor: vendor
%w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday].each do |day|
  WeekdayTimeRange.create! day: day, start_in_mins: 11*60, end_in_mins: 17*60, vendor: vendor
end
p "Seeded #{vendor.name}"


location = Location.create! street: "109 rue des moulins",
                            town: "Chamonix",
                            latitude: "45.9239859",
                            longitude: "6.870047"
vendor = Vendor.create! name: 'Pizzeria des Moulins',
                        delivers: true,
                        location: location,
                        information: "Delivery 6-7pm and 7:30-8:30pm
                        Tines - Les Houches.
                        Argentiere or Servoz can be arranged with a meeting place"
ContactChannel.create! name: ContactChannel::FACEBOOK, label: "pizzeriadesmoulins", value: "https://www.facebook.com/pizzeriadesmoulins/", vendor: vendor
ContactChannel.create! name: ContactChannel::TELEPHONE, label: "06 70 68 99 82", value: "tel:0670689982", vendor: vendor
%w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday].each do |day|
  WeekdayTimeRange.create! day: day, start_in_mins: 14*60, end_in_mins: 17*60, vendor: vendor
end
p "Seeded #{vendor.name}"


location = Location.create! street: "27 Place des Seracs",
                            town: "Chamonix",
                            latitude: "45.9129741",
                            longitude: "6.853036"
vendor = Vendor.create! name: 'Bar pizzeria les pelarnis',
                        delivers: false,
                        location: location
ContactChannel.create! name: ContactChannel::WEBSITE, label: "bar-les-pelarnis.business.site", value: "https://bar-les-pelarnis.business.site/", vendor: vendor
ContactChannel.create! name: ContactChannel::TELEPHONE, label: "04 50 89 79 85", value: "tel:0450897985", vendor: vendor
%w[Monday Tuesday Wednesday Thursday Friday Saturday].each do |day|
  WeekdayTimeRange.create! day: day, start_in_mins: 11*60, end_in_mins: 13*60, vendor: vendor
  WeekdayTimeRange.create! day: day, start_in_mins: 18*60, end_in_mins: 20*60, vendor: vendor
end
p "Seeded #{vendor.name}"


location = Location.create! street: "1486 Route des Praz",
                            town: "Chamonix",
                            latitude: "45.9398511",
                            longitude: "6.8837126"
vendor = Vendor.create! name: 'Le Petit Social',
                        delivers: false,
                        location: location,
                        information: "Customers can drive up and stay in their cars if they want"
ContactChannel.create! name: ContactChannel::FACEBOOK, label: "Le-Petit-Social", value: "https://www.facebook.com/Le-Petit-Social-176633812916236/", vendor: vendor
ContactChannel.create! name: ContactChannel::TELEPHONE, label: "06 72 11 96 19", value: "tel:0672119619", vendor: vendor
%w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday].each do |day|
  WeekdayTimeRange.create! day: day, start_in_mins: 8*60, end_in_mins: 12*60, vendor: vendor
end
p "Seeded #{vendor.name}"


location = Location.create! street: "150 chemin des avouilles",
                            town: "Chamonix",
                            latitude: "45.9166271",
                            longitude: "6.8532528"
vendor = Vendor.create! name: 'Chamonixmiam',
                        delivers: true,
                        location: location,
                        information: "Good to order 1 day in advance
                        Delivers: Argentiere - Servoz"
ContactChannel.create! name: ContactChannel::WEBSITE, label: "www.chamonixmiam.com", value: "https://www.chamonixmiam.com/", vendor: vendor
ContactChannel.create! name: ContactChannel::TELEPHONE, label: "06 47 40 67 70", value: "tel:0647406770", vendor: vendor
%w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday].each do |day|
  WeekdayTimeRange.create! day: day, start_in_mins: 18*60, end_in_mins: 22*60, vendor: vendor
end
p "Seeded #{vendor.name}"


location = Location.create! street: "653 Av des Alpages",
                            town: "Les Houches",
                            latitude: "45.8956587",
                            longitude: "6.8034433"
vendor = Vendor.create! name: 'Restaurant Gandhi',
                        delivers: false,
                        location: location
ContactChannel.create! name: ContactChannel::WEBSITE, label: "www.restaurantgandhi.fr", value: "http://www.restaurantgandhi.fr/", vendor: vendor
ContactChannel.create! name: ContactChannel::TELEPHONE, label: "04 50 54 63 96", value: "tel:0450546396", vendor: vendor
ContactChannel.create! name: ContactChannel::TELEPHONE, label: "06 10 61 45 27", value: "tel:0610614527", vendor: vendor
%w[Wednesday Thursday Friday Saturday Sunday].each do |day|
  WeekdayTimeRange.create! day: day, start_in_mins: 17*60, end_in_mins: 20*60, vendor: vendor
end
p "Seeded #{vendor.name}"


location = Location.create! street: "185 Route de l'Eglise",
                            town: "Les Houches",
                            latitude: "45.8912727",
                            longitude: "6.7990408"
vendor = Vendor.create! name: 'Pizzeria Lou Vio',
                        delivers: false,
                        location: location
ContactChannel.create! name: ContactChannel::WEBSITE, label: "www.tripadvisor.fr", value: "https://www.tripadvisor.com/Restaurant_Review-g651752-d7021504-Reviews-Pizza_Lou_Vio-Les_Houches_Chamonix_Haute_Savoie_Auvergne_Rhone_Alpes.html", vendor: vendor
ContactChannel.create! name: ContactChannel::TELEPHONE, label: "06 07 77 35 59", value: "tel:0607773559", vendor: vendor
%w[Friday Saturday Sunday].each do |day|
  WeekdayTimeRange.create! day: day, start_in_mins: 18*60, end_in_mins: 20*60, vendor: vendor
end
p "Seeded #{vendor.name}"


location = Location.create! street: "31 Rue Whymper",
                            town: "Chamonix",
                            latitude: "45.9236704",
                            longitude: "6.8694594"
vendor = Vendor.create! name: 'MUMMA',
                        delivers: false,
                        location: location,
                        information: "Pre-orders must be made before 4pm on the day."
ContactChannel.create! name: ContactChannel::WEBSITE, label: "www.mumma.fr", value: "https://www.mumma.fr/welcome", vendor: vendor
ContactChannel.create! name: ContactChannel::FACEBOOK, label: "MummaRestaurant", value: "https://www.facebook.com/MummaRestaurant/", vendor: vendor
ContactChannel.create! name: ContactChannel::TELEPHONE, label: "04 50 53 05 08‬", value: "tel:0450530508‬", vendor: vendor
%w[Friday Saturday].each do |day|
  WeekdayTimeRange.create! day: day, start_in_mins: 18*60+30, end_in_mins: 19*60+45, vendor: vendor
end
p "Seeded #{vendor.name}"


location = Location.create! street: "1124, route d'Argentière",
                            town: "Argentiere",
                            latitude: "45.9674269",
                            longitude: "6.9135439"
vendor = Vendor.create! name: 'La Remise',
                        delivers: true,
                        location: location,
                        information: "Varying opening times each week
                        Checkout Facebook for the latest info"
ContactChannel.create! name: ContactChannel::FACEBOOK, label: "La Remise", value: "https://www.facebook.com/lapopuproti/", vendor: vendor
ContactChannel.create! name: ContactChannel::TELEPHONE, label: "07 71 63 49 37", value: "tel:0771634937", vendor: vendor
%w[Wednesday Friday Saturday Sunday].each do |day|
  WeekdayTimeRange.create! day: day, start_in_mins: 9*60, end_in_mins: 11*60, vendor: vendor
end
p "Seeded #{vendor.name}"


location = Location.create! street: "116 rue des moulins",
                            town: "Chamonix",
                            latitude: "45.9246825",
                            longitude: "6.8683913"
vendor = Vendor.create! name: 'Cool Cats',
                        delivers: true,
                        location: location,
                        information: "Home delivery only."
ContactChannel.create! name: ContactChannel::WEBSITE, label: "coolcatsrestaurants.com", value: "http://coolcatsrestaurants.com/", vendor: vendor
ContactChannel.create! name: ContactChannel::FACEBOOK, label: "Cool Cats Chamonix", value: "https://www.facebook.com/coldcats.fr/", vendor: vendor
ContactChannel.create! name: ContactChannel::TELEPHONE, label: "04 50 34 16 39", value: "tel:0450341639", vendor: vendor
%w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday].each do |day|
  WeekdayTimeRange.create! day: day, start_in_mins: 12*60, end_in_mins: 19*60, vendor: vendor
end
p "Seeded #{vendor.name}"


location = Location.create! street: "1459 Route des Praz",
                            town: "Chamonix",
                            latitude: "45.9400511",
                            longitude: "6.8809322"
vendor = Vendor.create! name: 'Les Lanchers',
                        delivers: false,
                        information: "Temporary timetable",
                        location: location
ContactChannel.create! name: ContactChannel::FACEBOOK, label: "leslancherstheplacetostay", value: "https://www.facebook.com/leslancherstheplacetostay/", vendor: vendor
ContactChannel.create! name: ContactChannel::WEBSITE, label: "lanchers.com", value: "https://www.lanchers.com/", vendor: vendor
ContactChannel.create! name: ContactChannel::TELEPHONE, label: "04 50 53 47 19", value: "tel:0450534719", vendor: vendor
%w[Thursday Friday Saturday Sunday].each do |day|
  WeekdayTimeRange.create! day: day, start_in_mins: 16*60, end_in_mins: 20*60, vendor: vendor
end
p "Seeded #{vendor.name}"


location = Location.create! street: "81 Avenue des Alpages",
                            town: "Les Houches",
                            latitude: "45.892508",
                            longitude: "6.800399"
vendor = Vendor.create! name: 'Le Solerey',
                        delivers: false,
                        information: "Takeaway beer and wine only",
                        location: location
ContactChannel.create! name: ContactChannel::FACEBOOK, label: "lesolereybrewpub", value: "https://www.facebook.com/lesolereybrewpub/", vendor: vendor
ContactChannel.create! name: ContactChannel::TELEPHONE, label: "04 56 37 46 85", value: "tel:0456374685", vendor: vendor
%w[Wednesday Thursday Friday Saturday Sunday].each do |day|
  WeekdayTimeRange.create! day: day, start_in_mins: 16*60, end_in_mins: 19*60, vendor: vendor
end
p "Seeded #{vendor.name}"


location = Location.create! street: "47 Rue du Docteur Paccard ",
                            town: "Chamonix",
                            latitude: "45.9224543",
                            longitude: "6.8667642"
vendor = Vendor.create! name: 'Poco loco',
                        delivers: true,
                        location: location
ContactChannel.create! name: ContactChannel::WEBSITE, label: "Cham at home", value: "https://www.chamathome.com/poco-loco", vendor: vendor
ContactChannel.create! name: ContactChannel::FACEBOOK, label: "Poco Loco", value: "https://www.facebook.com/Poco-Loco-358271530853470/", vendor: vendor
ContactChannel.create! name: ContactChannel::TELEPHONE, label: "04 50 53 43 03", value: "tel:0450534303", vendor: vendor
%w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday].each do |day|
  WeekdayTimeRange.create! day: day, start_in_mins: 12*60, end_in_mins: 15*60, vendor: vendor
  WeekdayTimeRange.create! day: day, start_in_mins: 18*60, end_in_mins: 20*60, vendor: vendor
end
p "Seeded #{vendor.name}"


location = Location.create! street: "424 Rue Joseph Vallot",
                            town: "Chamonix",
                            latitude: "45.9269668",
                            longitude: "6.8681288"
vendor = Vendor.create! name: 'Pizza & Vino ',
                        delivers: true,
                        location: location
ContactChannel.create! name: ContactChannel::WEBSITE, label: "Cham at home", value: "https://www.chamathome.com/pizza-and-vino", vendor: vendor
ContactChannel.create! name: ContactChannel::FACEBOOK, label: "Pizza & Vino", value: "https://www.facebook.com/Pizza-Vino-Chamonix-111787750342321/", vendor: vendor
ContactChannel.create! name: ContactChannel::TELEPHONE, label: "04 50 55 25 93", value: "tel:0450552593", vendor: vendor
%w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday].each do |day|
  WeekdayTimeRange.create! day: day, start_in_mins: 12*60, end_in_mins: 20*60, vendor: vendor
end
p "Seeded #{vendor.name}"
