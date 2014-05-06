class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception
  before_filter :assign_entries
  before_filter :assign_links
  
  PAGES = [:home, :about, :upcoming, :contact]
  
  def index    
    @pages = PAGES

    respond_to do |format|
      format.html
    end
  
  end
  
  private
  
  def assign_entries
    @visible = { testimonials: Testimonial.visible,
                 acts:         Act.all,
                 future_gigs:  Gig.future.visible.map(&:gig_entry),
                 past_gigs:    Gig.past.visible.map(&:gig_entry),
                 performers:   Performer.all }.with_indifferent_access
    @hidden = {  testimonials: Testimonial.hidden, 
                 future_gigs:  Gig.future.hidden.map(&:gig_entry),
                 past_gigs:    Gig.past.hidden.map(&:gig_entry) }
    @contact = { email:        ContactMethod.named('Email').value,
                 phone:        ContactMethod.named('Phone').value,
                 socials:      Social.on_contact }.with_indifferent_access

    @performances =    Performance.all
  end
  
  def assign_links
    @socials =         Social.all
    @externals =       External.all
    @contact_socials = Social.on_contact
    
    @cd_link =         Link.named 'Buy our CD!'
    @demo_link =       Link.named 'View our Demo'    
  end  
  
end
