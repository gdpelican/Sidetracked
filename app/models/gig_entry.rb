class GigEntry < Entry
  
  def self.build(gig)
    
    attrs = { title: gig.name,
              picture: gig.act.picture,
              subtitle: "#{gig.city}, #{gig.state}",
              content: "#{gig.date_range}<br/>#{gig.description}<br/>#{link_to('More Info >>', gig.link) if gig.link}" }
    gig.new_record? ? gig.gig_entry = create!(attrs) : gig.gig_entry.update_attributes(attrs)
    
    gig.gig_entry
  end
  
  def content
    self[:content].html_safe
  end

end