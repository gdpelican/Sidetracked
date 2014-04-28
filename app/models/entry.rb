class Entry < ActiveRecord::Base
  
  scope :of_type, ->(type) { where type: Entry.resolve_gig(type) }
  
  def uses(field)
    !self.class.unused.include? field
  end
  
  def self.resolve_gig(type)
    type == 'gig' ? 'GigEntry' : type.to_s.singularize.humanize
  end
  
  def self.types 
    [:gig_entry, :testimonial, :performer, :act]
  end
  
  def self.unused
    []
  end
  
  has_attached_file :picture,
    styles: { thumb: "100x100#"},
    storage: :s3,
    default_url: 'missing_picture.png',
    s3_credentials: "#{Rails.root}/config/s3.yml",
    path: ":id/:style/:filename.:extension",
    bucket: "sidetracked-#{Rails.env}"
  validates_attachment_content_type :picture, content_type: %w(image/jpeg image/jpg image/png)
  
end
