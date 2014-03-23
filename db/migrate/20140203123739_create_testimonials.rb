class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.string :name
      t.has_attached_file :picture
      t.text :testimonial
      t.timestamps
    end
  end
end
