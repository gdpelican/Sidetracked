class ContactMethod < ActiveRecord::Base 
  def self.named(name)
    where(name: name).first
  end
end
