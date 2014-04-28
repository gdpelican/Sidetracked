class Act < Entry
  include Expandable
  
  def self.unused
    [:subtitle, :content]
  end
  
end
