class Entry < ActiveRecord::Base
  
  has_attached_file :picture,
    styles: { thumb: "100x100#"},
    storage: :s3,
    default_url: 'missing_picture.png',
    s3_credentials: "#{Rails.root}/config/s3.yml",
    path: ":id/:style/:filename.:extension",
    bucket: "sidetracked-#{Rails.env}"
  validates_attachment_content_type :picture, content_type: %w(image/jpeg image/jpg image/png)
  
end
