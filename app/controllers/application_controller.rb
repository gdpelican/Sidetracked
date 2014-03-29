class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  PAGES = [:home, :about, :upcoming, :contact]
  
  def index
    @alt = params[:alt]
    
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
    
    @socials =         Social.all
    @externals =       External.all
    @contact_socials = Social.on_contact
    
    @pages =           PAGES

    @cd_link =         Link.named 'Buy our CD!'
    @demo_link =       Link.named 'View our Demo'
    
    respond_to do |format|
      format.html
    end
  
  end
  
end
