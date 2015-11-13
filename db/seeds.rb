Booking.destroy_all
User.destroy_all
Bar.destroy_all
City.destroy_all
Gift.destroy_all

u = User.create(email: 'jchantereau@gmail.com', password: 'password', admin: true)
u.save!

city_params = [
  { name: 'Paris', pictures: 'http://prodigy.umbrella.al/travel1/wp-content/uploads/sites/9/2014/05/immobilier-paris.jpg' },
  { name: 'Lyon', pictures: 'http://www.lyon-france.com/var/ez_site/storage/images/media/images/quartier-saint-jean-dans-le-vieux-lyon/97807-1-fre-FR/Quartier-Saint-Jean-dans-le-Vieux-Lyon.jpg' },
  { name: 'Lille', pictures: 'https://upload.wikimedia.org/wikipedia/commons/f/f8/Lille_vue_gd_place.JPG' },
  { name: 'Bordeaux', pictures: 'https://upload.wikimedia.org/wikipedia/commons/d/d6/Place_de_la_Bourse,_Bordeaux,_France.jpg' },
  { name: 'Strasbourg', pictures: 'http://www.exittolive.com/images/cities/France/strasbourg.jpg' }
]

city_params.each do |params|
  city = City.create(name: params[:name])
  pic = Picture.new
  pic.imageable = city
  pic.picture = params[:pictures]
  pic.save
end

cities = City.all

bar_params = [
  { city: cities.first,
      name: 'Le Perchoir',
      address: '14 rue Crespin du Gast, 75011',
      pictures: 'http://www.lesnereidesjournal.com/wp-content/uploads/2014/07/perchoir2.jpg',
      description: 'An enormously popular new bar in Menilmontant, opened on a huge rooftop with a 360 degree view of the capital. Despite ‘speakeasy’ pretentions (the street entrance is unmarked),
      the place is becoming a victim of its own success, with queues out of the front door to be endured before you take the lift to the 7th floor.
      But once you do make it up there, you’ll find a vast space surrounding a handsome bar,
      comfortable sofas strewn with cushions, colourful plants and scented herbs planted in pots around the seats or hung from railings. Watching he sunset over the Sacré-Coeur, glass in hand, under garlands of coloured lights, really is something special.'
  },
  { city: cities.first,
      name: 'Mama Shelter',
      address: '109 rue de Bagnolet, 75020',
      pictures: 'http://static1.villaschweppes.com/articles/7/36/67/@/12183-mama-shelter-1230x680-1.jpg',
      description: 'Design and comfortable rooms rates at Mama Shelter. Discover too its warm bars & restaurants. A lively and essential place with free wifi and free movies.'
  },
  { city: cities.first,
      name: 'Le Comptoir general',
      address: '80 quai de Jemmapes, 75010',
      pictures: 'http://static1.villaschweppes.com/articles/7/10/55/7/@/68982-comptoir-general-1230x680-1.jpg',
      description: 'Le Comptoir Général is a temple dedicated to exoticism. As a curious adventurer and a voyage lover, it invites you to explore and appreciate these foreign and strange cultures, poorly known, sometimes underrated and often marginalized.
      Because exoticism does not only define itself through frontiers and territories, it is also rooted in history, traditions, communities, and exclusions...
      Thus, Le Comptoir Général explores these faraway lands, looking for the most powerful references and the best talents they might hide away. Once identified, it brings them back to life from the details of their decoration, to their slightest codes and moods.'
  },
  { city: cities.first,
      name: 'La Candelaria',
      address: '52 Rue de Saintonge, 75003',
      pictures: 'http://www.barmag.fr/wp-content/oqey_gallery/galleries/la-candelaria/galimg/img_3066.jpg',
      description: 'Excellent mexican place with strong but good cocktails'
  },
  { city: cities.first,
      name: 'La Fine Mousse',
      address: '6 bis avenue Jean Aicard, 75011',
      pictures: 'http://www.barmag.fr/wp-content/uploads/2013/12/GROWLER-FINE-MOUSSE-550.jpg',
      description: 'Quite small, shaped around the counter where many drinkers stay, La Fine Mousse also offers a few tables at the extremities, and is rather elegant, but not snobbish.
      The list of beers regularly changes, but there are always 20 different beers on tap, covering a wide range of tastes, colours or rates of alcohol, and more than 100 different bottled beers.
      In order to make up your mind, a short but accurate description of the characteristics of the beers is provided, and the staff is also very well informed about what they sell (I’m sure they can explain or advise you also in English).
      The prices are not too high, considering the quality of the beer: a demi (25 cl) costs about € 4.50 and there’s no invitation to take a pint (50 cl), so you’d better sip and savour your demis and taste several ones, as in a beer tasting.'
  },
  { city: cities.first,
      name: 'Pili Pili',
      address: '70 Rue Jean-Pierre Timbaud, 75011',
      pictures: 'https://az603150.vo.msecnd.net/e59b63d0-6b40-4842-bf27-1e2c00d7d0df-xl/DSC_3524.jpg',
      description: 'Cute small place, perfect to have a relaxing moment with one of their tasty cocktails'
  },
  { city: cities.first,
      name: 'Le lock groove',
      address: '15 rue Roger',
      pictures: 'http://upload.spottedbylocals.com/Paris/small/le-lock-groove-paris-(by-yuko-ogino).jpg',
      description: 'Le Lock Groove ticks all the obligatory boxes of a good bar: interesting décor, unconventional music, happy hour on cocktails and that priceless warm glow that blankets you and nudges you as if to say ‘go on, just stay for one more drink’.'
  },
  { city: cities.first,
      name: 'La comete',
      address: '140 Rue Roquette',
      pictures: 'http://upload.spottedbylocals.com/Paris/small/la-comete-paris-(by-outurbanartsboy).jpg',
      description: 'it’s all about the ingredients making up the ambience of this cafe-resto. Firstly, that it’s homely, but also the food too – it’s top notch and never fussy.
      After eating and in the earnest of a food coma I tend to enjoy gazing up at the many wall hangings around the place, enthralled by the copious depictions of food produce.
      And equally infatuated seeing they’re in a style as if painted by an old Flemish master.
      At La Comete there’s an honest mastery in the kitchen too.'
  },
  { city: cities.first,
      name: 'Les pères populaires',
      address: '46 Rue Buzenval',
      pictures: 'http://upload.spottedbylocals.com/Paris/small/les-peres-populaires-paris-(by-outurbanartsboy).jpg',
      description: 'Eating at Les Pères Populaires is simply great. There’s no hype. It’s just honest. A rare gem! If friends come along, well, afterwards they go on to rave about the place. It’s a bar/canteen at 46 Rue Buzenval bordering the popular working class 20th and 11th districts.'
  },
  { city: cities.first,
      name: 'Le Zéro Zéro',
      address: '89 Rue Amelot, 75011',
      pictures: 'https://media.timeout.com/images/100562543/750/422/image.jpg',
      description: 'The human body really packs down: if you don’t believe us, just check out Zéro Zéro of a weekend. It’s a battle even to open the door to the bar, which squeezes an immoderate number of people into a few square metres.
      The only solution is to dance along with everybody else, while spilling as little as possible of one’s drink.
      But if things do go bottoms up and you soak a few shirts, there’s no reason to fear: everyone quickly lets go in this highly charged and celebratory atmosphere.'
  },
  { city: cities.first,
      name: 'La ptite soeur',
      address: '15 rue des Trois Frères, 75018',
      pictures: 'https://media.timeout.com/images/102939798/750/422/image.jpg',
      description: 'Cosy, fuss-free and unpretentious, the P’tite Soeur perfectly conforms to the cliché of the homey Montmartre bar. From the same team behind La Petite Chaufferie in the 10th arrondissement (hence the name, which means ‘little sister’), this address is the ideal spot to come for early evening drinks, filling up as it does with office workers every weekday from 7pm.'
  },
]

bar_params.each do |params|
  bar = Bar.create(city: params[:city], name: params[:name], address: params[:address], description: params[:description])
  pic = Picture.new
  pic.imageable = bar
  pic.picture = params[:pictures]
  pic.save
end

bars = Bar.all

bars.each do |bar|
  Gift.create([{name: "Glass of wine", bar: bar, price: 5},
    {name: "Beer", bar: bar, price: 7},
    {name: "Cocktail", bar: bar, price: 9}])
end
