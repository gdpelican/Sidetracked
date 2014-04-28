class Testimonial < Entry
  include Expandable 
  
  #TODO: move into a decorator or something.
  def title
    self[:link].present? ? "<a href=\"#{self[:link]}\">#{self[:title]}</a>".html_safe
                : self[:title]
  end
  
  def content
    "\"#{self[:content]}\"" if self[:content]
  end
  
end
