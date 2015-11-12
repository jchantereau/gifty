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


Booking.destroy_all
User.destroy_all
Bar.destroy_all
City.destroy_all
Gift.destroy_all

u = User.create(email: 'jchantereau@gmail.com', password: 'password', admin: true)
u.save!

city_params = [{ name: 'Paris', pictures: 'http://prodigy.umbrella.al/travel1/wp-content/uploads/sites/9/2014/05/immobilier-paris.jpg' },
  { name: 'Lyon', pictures: 'http://www.la-loi-pinel.com/wp-content/uploads/2015/01/Lyon.jpg' },
  { name: 'Lille', pictures: 'http://www.aeroportlimoges.com/media/vols/Laurent%20Ghesquiere%20-%2020110701_14-35-56_LP_Lille_679.jpg' }]

city_params.each do |params|
  city = City.create(name: params[:name])
  pic = Picture.new
  pic.imageable = city
  pic.picture = params[:pictures]
  pic.save
end

cities = City.all

bar_params = [{ name: 'Le Perchoir', city: cities.first, address: '14 rue Crespin du Gast, 75011', pictures: 'http://www.lesnereidesjournal.com/wp-content/uploads/2014/07/perchoir2.jpg'},
              { name: 'Les BerThoM', city: cities[1], address: '24 Rue Pizay, 69001', pictures: 'http://s3-media1.fl.yelpcdn.com/bphoto/JiFo4hc75DURpTLi6qcE6Q/o.jpg'},
              { name: 'Gastama', city: cities[2], address: '109 Rue Saint-André, 59000', pictures: 'http://img.20mn.fr/lrL1xBbaSByOsDI4NzoghQ/648x360_gastama-bar-hostel-situe-rue-saint-andre-lille.jpg'},
              { name: 'La Fine Mousse', city: cities.first, address: '6 bis avenue Jean Aicard, 75011', pictures: 'http://www.barmag.fr/wp-content/uploads/2013/12/GROWLER-FINE-MOUSSE-550.jpg'}]

bar_params.each do |params|
  bar = Bar.create(name: params[:name], city: params[:city], address: params[:address])
  pic = Picture.new
  pic.imageable = bar
  pic.picture = params[:pictures]
  pic.save
end

bars = Bar.all

bars.each do |bar|
  Gift.create([{name: "Verre de vin", bar: bar, price: 5},
    {name: "Pinte", bar: bar, price: 5},
    {name: "Cocktail", bar: bar, price: 7}])
end
