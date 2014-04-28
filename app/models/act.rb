class Act < Entry
  include Expandable
  
  def self.unused
    [:subtitle, :content, :link]
  end
  
end
