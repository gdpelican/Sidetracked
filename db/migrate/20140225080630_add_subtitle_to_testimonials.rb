class AddSubtitleToTestimonials < ActiveRecord::Migration
  def change
    add_column :testimonials, :subtitle, :string
  end
end
