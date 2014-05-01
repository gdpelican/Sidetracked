class GigEntry < Entry
    
  def self.build!(gig)
    create! title: gig.name,
            picture: (gig.act.picture if gig.act),
            subtitle: "#{gig.city}, #{gig.state}",
            content: "#{gig.date_range}<br/>#{gig.description}<br/>#{"<a href=\"#{gig.link}\">More Info >></a>" if gig.link}"
  end
  
  def content
    self[:content].html_safe if self[:content]
  end

end