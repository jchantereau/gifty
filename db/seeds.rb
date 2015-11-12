# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Gift.destroy_all
# Bar.destroy_all
# City.destroy_all

# cities = City.create([{ name: 'Paris' }, { name: 'Lyon' }, { name: 'Lille' }])
# bars = Bar.create([{ name: 'Le Perchoir', city: cities.first, address: '14 rue Crespin du Gast, 75011' }, { name: 'La Fine Mousse', city: cities.first, address: '4 bis avenue Jean Aicard, 75011' }, { name: 'Le Magnum', city: cities[1], address: '57 rue Masséna, 59800'}])

# bars.each do |bar|
#   Gift.create([{name: "Verre de vin", bar: bar, price: 5}, {name: "Pinte", bar: bar, price: 5}, {name: "Cocktail", bar: bar, price: 5}])
# end
Booking.destroy_all
User.destroy_all
Bar.destroy_all
City.destroy_all
Gift.destroy_all

u = User.create(email: 'jchantereau@gmail.com', password: 'password', admin: true)
u.save!

cities = City.create([{ name: 'Paris', pictures: picture.url('http://prodigy.umbrella.al/travel1/wp-content/uploads/sites/9/2014/05/immobilier-paris.jpg') }, { name: 'Lyon', pictures: picture.url('http://www.la-loi-pinel.com/wp-content/uploads/2015/01/Lyon.jpg') }, { name: 'Lille', pictures: picture.url('http://www.aeroportlimoges.com/media/vols/Laurent%20Ghesquiere%20-%2020110701_14-35-56_LP_Lille_679.jpg') }])

bars = Bar.create([{ name: 'Le Perchoir', city: cities.first, address: '14 rue Crespin du Gast, 75011' }, pictures: picture.url('http://www.lesnereidesjournal.com/wp-content/uploads/2014/07/perchoir2.jpg') ])
