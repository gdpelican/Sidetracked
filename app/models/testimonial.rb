class Testimonial < Entry
  include Expandable
  
  def content
    "\"#{self[:content]}\""
  end
  
end
