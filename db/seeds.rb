# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Entry.destroy_all

Performer.create! [
  {title: 'Shoshanna Ruth', 
   picture: File.open("#{Rails.root}/public/images/performers/shosh.jpg")}, 
  {title: 'Kimberlie Cruse', 
   picture: File.open("#{Rails.root}/public/images/performers/kim.jpg")}]

Act.create! [
  { title: 'Bag Lady Theatre',
    picture: File.open("#{Rails.root}/public/images/acts/baglady.jpg") },
  { title: 'Fairy Ring Theatre',
    picture: File.open("#{Rails.root}/public/images/acts/fairies.jpg") },
  { title: 'Wandering Gypsy Theatre', 
    picture: File.open("#{Rails.root}/public/images/acts/gypsies.jpg") },
  { title: 'Anne Bonney & Mary Reed',
    picture: File.open("#{Rails.root}/public/images/acts/pirates.jpg") },
  { title: 'Fire & Brimstone', 
    picture: File.open("#{Rails.root}/public/images/acts/devils.jpg") }
]

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

ContactMethod.destroy_all
email = ContactMethod.create! name: 'Email', value: 'sidetrackedinfo@gmail.com'
phone = ContactMethod.create! name: 'Phone', value: '717 226 0339'

Social.destroy_all
Social.create! [
  { name: 'Facebook', href: 'https://www.facebook.com/SidetrackedProductions', title: 'Like us on Facebook', icon: 'facebook', on_contact: true },
  { name: 'Twitter', href: 'http://www.twitter.com/SidetrackedProductions', title: 'Follow us on Twitter', icon: 'twitter', on_contact: true },
  { name: 'Youtube', href: 'http://www.youtube.com/YourSidetracked', title: 'Watch us on Youtube', icon: 'youtube', on_contact: true },
  { name: 'Email', href: "mailto:#{email.value}", icon: 'envelope'},
  { name: 'Buy our CD!', href: 'http://www.example.com', icon: 'music', on_contact: true },
  { name: 'View our Demo', href: 'http://www.youtube.com/watch?v=3YhBU5dKOso', icon: 'film' }
]

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

Performance.destroy_all
gigs1 = [ Performance.new({ date: 1.day.from_now }), Performance.new({ date: 2.days.from_now }), Performance.new({ date: 2.days.ago })]
gigs2 = [ Performance.new({ date: 1.week.from_now }), Performance.new({ date: 10.days.from_now}), Performance.new({ date: 2.weeks.from_now })]
gigs3 = [ Performance.new({ date: 6.days.ago }), Performance.new({ date: 7.days.ago }), Performance.new({ date: 8.days.ago})]

Gig.destroy_all
Gig.create! [
  { name: 'Miami Renaissance Festival', 
    city: 'Miami', 
    state: 'FL', 
    description: 'Suspended Between Myth and History -  Cauley Square Historic Village WANDERING GYPSY THEATER for the first time ever, will wander the streets and pubs with their vaudeville renaissance stylings.',
    link: 'http://www.ren-fest.com/tickets.asp',
    act: Act.where(title: 'Wandering Gypsy Theatre').first,
    performances: Performance.collection(2.days.from_now) },
  { name: 'Festival of Legends', 
    city: 'Chapel Hill', 
    state: 'NC', 
    description: 'The third annual Festival of Legends will be returning to Storybrook Farms! FAERIE RING THEATER will return to charm you with their vaudeville storytelling.', 
    link: 'http://www.festivaloflegends.com',
    act: Act.where(title: 'Fairy Ring Theatre').first,
    performances: Performance.collection(5.days.from_now) },
  { name: 'Spoutwood May Day Faerie Festival',
    city: 'Spoutwood Farm',
    state: 'PA', 
    description: 'Once again, the festival will celebrate the beginning of spring with 70 arts and crafts vendors (mostly featuring handmade art inspired by the little people), performances by musicians, dancers, and storytellers. FAERIE RING THEATER will join Spoutwood once again with their whimsical stories!', 
    link: 'http://www.spoutwood.org/fairie-festival',
    act: Act.where(title: 'Fairy Ring Theatre').first,
    performances: Performance.collection(Date.tomorrow) }
]
