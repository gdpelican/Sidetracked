class Link < ActiveRecord::Base
  
  scope :on_contact, -> { where(on_contact: true) }
  
  def self.named(name)
    where(name: name).first
  end
end
