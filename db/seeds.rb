# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
Location.destroy_all
Vendor.destroy_all

location = Location.create! street: "77 Place Edmond Desailloud", town: "Chamonix"
Vendor.create! name: 'Bighorn Bistro & Bakery', delivers: false, location: location

location = Location.create! street: "67 Promenade Marie Paradis", town: "Chamonix"
Vendor.create! name: 'The Dainty Pizza', delivers: true, location: location

location = Location.create! street: "23 rue du Docteur Paccard", town: "Chamonix"
Vendor.create! name: 'La Maison des Burgers', delivers: false, location: location

location = Location.create! street: "416 rue Joseph Vallot", town: "Chamonix"
Vendor.create! name: 'Hibou Deli', delivers: false, location: location
  
