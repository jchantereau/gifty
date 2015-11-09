# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   Mayor.create(name: 'Emanuel', city: cities.first)
Gift.destroy_all
Bar.destroy_all
City.destroy_all
Friend.destroy_all

cities = City.create([{ name: 'Paris' }, { name: 'Lyon' }, { name: 'Lille' }])
bars = Bar.create([{ name: 'Le Perchoir', city: cities.first, address: '14 rue Crespin du Gast, 75011' }, { name: 'La Fine Mousse', city: cities.first, address: '4 bis avenue Jean Aicard, 75011' }, { name: 'Le Magnum', city: cities[1], address: '57 rue Masséna, 59800'}])
friends = Friend.create([{ name: 'Thomas', email: 'thomas.joet.fr@gmail.com' }, { name: 'Julien', email: 'julien@gmail.com' }, { name: 'Arthur', email: 'arthur@gmail.com' }])

bars.each do |bar|
  Gift.create([{name: "Verre de vin", bar: bar, price: 5}, {name: "Pinte", bar: bar, price: 5}, {name: "Cocktail", bar: bar, price: 5}])
end
