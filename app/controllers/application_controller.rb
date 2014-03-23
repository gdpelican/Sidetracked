class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  PAGES = [:home, :about, :upcoming, :contact]
  
  def index
    @visible = { testimonials: Testimonial.visible,
                 acts:         Act.all,
                 future_gigs:  Gig.future.visible.map(&:gig_entry),
                 past_gigs:    Gig.past.visible.map(&:gig_entry),
                 performers:   Performer.all }
    @hidden = {  testimonials: Testimonial.hidden, 
                 future_gigs:  Gig.future.hidden.map(&:gig_entry),
                 past_gigs:    Gig.past.hidden.map(&:gig_entry) }

    @performances = Performance.all
    @socials =      Social.all
    @externals =    External.all
    @pages =        PAGES

    @cd_link =      Link.named 'Buy our CD!'
    @demo_link =    Link.named 'View our Demo'
    
    respond_to do |format|
      format.html
    end
  
  end
  
end
