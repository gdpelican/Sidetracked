class AddSubtitleToTestimonials < ActiveRecord::Migration
  def change
    add_column :testimonials, :subtitle, :string if table_exists? :testimonials
  end
end
