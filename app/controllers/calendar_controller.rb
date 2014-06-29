class CalendarController < ActionController::Base
  include SimpleCalendar::ViewHelpers
  include ActionView::Helpers::OutputSafetyHelper
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::TextHelper
  include ActionView::Context
  
  def create
    params[:month] = (params[:month] || Date.today.month).to_i
    params[:year]  = (params[:year]  || Date.today.year).to_i
    @performances = Performance.by_gig_id params[:gig_id] 

    render json: {
      calendar: gig_calendar(@performances.joins(:gig_entry), params),
      dates: @performances.to_json 
    }
  end
  
  private
  
  def gig_calendar(performances, params)
    calendar(performances, params) do |event|
      concat render_event_entry(event) unless params[:gig_id]
    end
  end

  def render_event_entry(event)
    render_to_string(template: 'entries/show', locals: { entry: event.gig_entry }).html_safe
  end
  
  def link_to(name, text, options = {})
    view_context.link_to name, text, options
  end
  
end
