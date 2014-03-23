class MergeEntriesTable < ActiveRecord::Migration
  def change
    drop_table :testimonials if table_exists? :testimonials
    drop_table :acts if table_exists? :acts
    
    create_table :entries do |t|
      t.string :type
      t.has_attached_file :picture
      t.string :title
      t.string :subtitle
      t.text :content
      t.string :link
      t.timestamps
    end
    
  end
end
