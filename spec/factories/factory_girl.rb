FactoryGirl.define do
  trait :entry do
    title 'entry title'
    subtitle 'entry subtitle'
    content 'test description'
    link 'http://www.example.com'
  end
  
  factory :act do
    entry
  end
  
  factory :performer do
    entry
  end
  
  factory :testimonial do
    entry
  end
  
  trait :link do
    name 'link'
    href 'http://www.test.com'
    icon 'user'
    title 'link title'
    on_contact false
  end
  
  factory :external do
    link
  end
  
  factory :social do
    link
  end
  
  factory :gig do
    
  end
  
  factory :performance do
    date Date.today
  end
  
end