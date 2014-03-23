class CalendarController < ActionController::Base
  include SimpleCalendar::ViewHelpers
  include ActionView::Helpers::OutputSafetyHelper
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::TextHelper
  include ActionView::Context
  
  def create
    params[:month] = (params[:month] || Date.today.month).to_i
    params[:year]  = (params[:year]  || Date.today.year).to_i
    
    render text: calendar(Performance.all.joins(:gig_entry), params, &->(event) { 
      concat render_to_string(template: 'entries/show', locals: { entry: event.gig_entry }).html_safe
    })
  end
  
  private
  
  def link_to(name, text, options = {})
    view_context.link_to name, text, options
  end
  
end
