class DataService
  def self.visible
    { testimonials: Testimonial.visible,
      acts:         Act.all,
      future_gigs:  Gig.future.visible.map(&:gig_entry),
      past_gigs:    Gig.past.visible.map(&:gig_entry),
      performers:   Performer.all }.with_indifferent_access  
  end
  
  def self.hidden
    {  testimonials: Testimonial.hidden, 
       future_gigs:  Gig.future.hidden.map(&:gig_entry),
       past_gigs:    Gig.past.hidden.map(&:gig_entry) }  
  end
  
  def self.contact
    { email:        ContactMethod.named('Email').value,
      phone:        ContactMethod.named('Phone').value,
      socials:      Social.on_contact }.with_indifferent_access  
  end
  
  def self.socials
    Social.all
  end
  
  def self.externals
    External.all
  end
  
  def self.contact_socials
    Social.on_contact
  end
  
  def self.cd_link
    Link.named 'Buy our CD!'
  end
  
  def self.demo_link
    Link.named 'View our Demo'
  end
  
  def self.pages
    [:home, :about, :upcoming, :contact]
  end
  
end