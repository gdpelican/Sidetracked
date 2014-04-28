class Performer < Entry
  def self.unused
    [:subtitle, :content, :link]
  end
end
