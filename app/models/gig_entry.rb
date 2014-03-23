class GigEntry < Entry
  
  def self.build(gig)
    create!(id: (gig.gig_entry.id rescue nil),
            title: gig.name, 
            picture: gig.act.picture, 
            subtitle: "#{gig.city}, #{gig.state}", 
            content: gig.description)
  end

end