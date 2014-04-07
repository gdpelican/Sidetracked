# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Entry.destroy_all
puts 'Previous entries destroyed'

Performer.create! [
  {title: 'Shoshanna Ruth', 
   picture: File.open("#{Rails.root}/public/images/performers/shosh.jpg")}, 
  {title: 'Kimberlie Cruse', 
   picture: File.open("#{Rails.root}/public/images/performers/kim.jpg")}]
puts 'Performers created'

Act.create! [
  { title: 'Bag Lady Theatre',
    picture: File.open("#{Rails.root}/public/images/acts/baglady.jpg"),
    link: '/audio/sample.mp3' },
  { title: 'Fairy Ring Theatre',
    picture: File.open("#{Rails.root}/public/images/acts/fairies.jpg"),
    link: '/audio/sample.mp3' },
  { title: 'Wandering Gypsy Theatre', 
    picture: File.open("#{Rails.root}/public/images/acts/gypsies.jpg"),
    link: '/audio/sample.mp3' },
  { title: 'Anne Bonney & Mary Reed',
    picture: File.open("#{Rails.root}/public/images/acts/pirates.jpg"),
    link: '/audio/sample.mp3' },
  { title: 'Fire & Brimstone', 
    picture: File.open("#{Rails.root}/public/images/acts/devils.jpg"),
    link: '/audio/sample.mp3' }
]
puts 'Acts created'

Testimonial.create! [
  { title: 'Mark Lewis',
    subtitle: 'Lauging Moon Productions', 
    content: 'Smart, talented, funny AND they know how to play. Their shows are energetic, entertaining, well-rehearsed and spot-on.',
    link: 'http://www.laughingmooninc.com/',
    picture: File.open("#{Rails.root}/public/images/testimonials/mark.jpg") },
  { title: 'Steven Samuels', 
    subtitle: 'Mountain Xpress Asheville', 
    content: 'Two very funny women', 
    link: 'http://www.mountainx.com/article/30069/Review-of-the-Americana-Burlesque-and-Sideshow-fest',
    picture: File.open("#{Rails.root}/public/images/testimonials/mx.jpg") },
  { title: 'Jack "Doc" Strauss',
    subtitle: 'Director, Coxcomb Academy',
    content: 'Best act to come out of Vaudeville in years...I cannot recommend them enough.',
    link: 'http://www.coxcomb.org/',
    picture: File.open("#{Rails.root}/public/images/testimonials/jack.jpg") },
  { title: 'Paulo Garbanzo', 
    subtitle: 'Juggler, Fool of Muncaster Castle', 
    content: 'These two are so funny, they might be a threat to my comedic empire ...Minions! Break their kneecaps!',
    picture: File.open("#{Rails.root}/public/images/testimonials/paulo.jpg") },
  { title: 'Amanda Ash', 
    subtitle: 'Edmonton Journal', 
    content: 'Cruse is a pickup line master', 
    link: 'http://www.edmontonjournal.com/Edmonton+Fringe+performers+share+their+pickup+lines/7118108/story.html',
    picture: File.open("#{Rails.root}/public/images/testimonials/ej.jpg") },
  { title: 'Remi',
    subtitle: 'Age 6', 
    content: 'It was silly. Good silly.', 
    link: '',
    picture: File.open("#{Rails.root}/public/images/testimonials/remi.jpg") },
  { title: 'Peter Gaffney', 
    subtitle: 'Neo Sequiter Productions',
    link: 'http://www.neosequiter.com', 
    content: 'These girls are tighter than anybody.',
    picture: File.open("#{Rails.root}/public/images/testimonials/peter.jpg") }
]
puts 'Testimonials created'

ContactMethod.destroy_all
email = ContactMethod.create! name: 'Email', value: 'sidetrackedinfo@gmail.com'
phone = ContactMethod.create! name: 'Phone', value: '717 226 0339'
puts 'ContactMethods created'

Social.destroy_all
Social.create! [
  { name: 'Facebook', href: 'https://www.facebook.com/SidetrackedProductions', title: 'Like us on Facebook', icon: 'facebook', on_contact: true },
  { name: 'Twitter', href: 'http://www.twitter.com/SidetrackedProductions', title: 'Follow us on Twitter', icon: 'twitter', on_contact: true },
  { name: 'Youtube', href: 'http://www.youtube.com/YourSidetracked', title: 'Watch us on Youtube', icon: 'youtube', on_contact: true },
  { name: 'Email', href: "mailto:#{email.value}", icon: 'envelope'},
  { name: 'Buy our CD!', href: 'http://bit.do/SidetrackedCD', icon: 'music', on_contact: true },
  { name: 'View our Demo', href: 'http://www.youtube.com/watch?v=3YhBU5dKOso', icon: 'film' }
]
puts 'Socials created'

External.destroy_all
External.create! [
  { name: 'Louisiana Renaissance Faire', href: 'http://www.la-renfest.com' },
  { name: 'Cheeky Monkey Sideshow', href: 'http://www.cheekymonkeysideshow.com/' },
  { name: 'Moonshine Cabaret', href: 'https://www.facebook.com/MoonshineCabaret' },
  { name: 'Cabaret Red Light', href: 'http://www.cabaretredlight.com'},
  { name: 'Paulo Garbanzo', href: 'http://www.garbanzojuggling.com' },
  { name: 'Fashoo the Fool', href: 'http://www.rentafool.com/fashoo.htm' },
  { name: 'Laughing Moon Productions', href: 'http://www.laughingmooninc.com' } 
]
puts 'Externals created'

Performance.destroy_all
miami_gigs = [ 
  Performance.new({ date: DateTime.new(2014, 3, 29) }), 
  Performance.new({ date: DateTime.new(2014, 3, 30) }), 
  Performance.new({ date: DateTime.new(2014, 4, 5) }), 
  Performance.new({ date: DateTime.new(2014, 4, 6) }), 
  Performance.new({ date: DateTime.new(2014, 4, 12) }), 
  Performance.new({ date: DateTime.new(2014, 4, 13) })
]

fol_gigs = [
  Performance.new({ date: DateTime.new(2014, 4, 26) }),
  Performance.new({ date: DateTime.new(2014, 4, 27) }) 
]

sw_gigs = [
  Performance.new({ date: DateTime.new(2014, 5, 2) }), 
  Performance.new({ date: DateTime.new(2014, 5, 3) }),
  Performance.new({ date: DateTime.new(2014, 5, 4) })   
]

mff_gigs = [
  Performance.new({ date: DateTime.new(2014, 5, 10) }), 
  Performance.new({ date: DateTime.new(2014, 5, 11) })
]

five_gigs = [
  Performance.new({ date: DateTime.new(2014, 5, 18) })   
]

nj_gigs = [
  Performance.new({ date: DateTime.new(2014, 5, 31) }), 
  Performance.new({ date: DateTime.new(2014, 6, 1) }), 
  Performance.new({ date: DateTime.new(2014, 6, 7) }), 
  Performance.new({ date: DateTime.new(2014, 6, 8) }) 
]

flag_gigs = [
  Performance.new({ date: DateTime.new(2014, 6, 14) })
]
puts 'Gigs created'

Gig.destroy_all
Gig.create! [
  { name: 'Miami Renaissance Festival', 
    city: 'Miami', 
    state: 'FL', 
    description: 'Suspended Between Myth and History -  Cauley Square Historic Village WANDERING GYPSY THEATER for the first time ever, will wander the streets and pubs with their vaudeville renaissance stylings.',
    link: 'http://www.ren-fest.com/tickets.asp',
    act: Act.where(title: 'Wandering Gypsy Theatre').first,
    performances: miami_gigs },
  { name: 'Festival of Legends', 
    city: 'Chapel Hill', 
    state: 'NC', 
    description: 'The third annual Festival of Legends will be returning to Storybrook Farms! FAERIE RING THEATER will return to charm you with their vaudeville storytelling.', 
    link: 'http://www.festivaloflegends.com',
    act: Act.where(title: 'Fairy Ring Theatre').first,
    performances: fol_gigs },
  { name: 'Spoutwood May Day Faerie Festival',
    city: 'Spoutwood Farm',
    state: 'PA', 
    description: 'Once again, the festival will celebrate the beginning of spring with 70 arts and crafts vendors (mostly featuring handmade art inspired by the little people), performances by musicians, dancers, and storytellers. FAERIE RING THEATER will join Spoutwood once again with their whimsical stories!', 
    link: 'http://www.spoutwood.org/fairie-festival',
    act: Act.where(title: 'Fairy Ring Theatre').first,
    performances: sw_gigs },
  { name: 'Maryland Faerie Festival',
    city: 'Darlington',
    state: 'MD', 
    description: 'Come and enjoy the pageantry, magic, music, and mischief! Atmosphere and entertainment inspired by Faerie folklore and literature, and, of course, by the Faeries themselves. FAERIE RING THEATER will join the Maryland Faerie Festival for the the first time!',
    link: 'http://www.marylandfaeriefestival.com',
    act: Act.where(title: 'Fairy Ring Theatre').first,
    performances: mff_gigs },
  { name: 'Five Minute Follies',
    city: 'Philadelphia',
    state: 'PA',
    description: 'The Five Minute Follies is old fashioned variety entertainment for all ages. Joining Sidetracked will be the usual array of fabulous Five Minute Follies performers, including belly dancer Fatima Bassmah, pop culture comic Craig Liggeons, singer Tommy Delcorio Jr, sketch comedian Hannah Sandler as Mortimer, and more.',
    link: 'https://www.facebook.com/events/345628442244829/',
    act: Act.where(title: 'Fire & Brimstone').first,
    performances: five_gigs },
  { name: 'New Jersey Renaissance Festival',
    city: 'Bordentown',
    state: 'NJ',
    description: 'Welcome to Crossford, the crossroads where fantasy and reality meet! FAERIE RING THEATER will join the NJ Renaissance Festival for the the first time!',
    link: 'http://www.njrenfaire.com/Online_Store.html',
    act: Act.where(title: 'Fairy Ring Theatre').first,
    performances: nj_gigs },
  { name: 'Flag Day at the Betsy Ross House',
    city: 'Philadelphia',
    state: 'PA',
    description: 'Sidetracked is back once again for the Betsy Ross House’s annual Flag Day Celebration! Come enjoy some lovely entertainment while celebrating history!',
    link: 'http://historicphiladelphia.org/betsy-ross-house/what-to-see/',
    act: Act.where(title: 'Bag Lady Theatre').first,
    performances: flag_gigs }  
]
puts 'Performances created'
