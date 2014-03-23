class AddLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :type
      t.string :name
      t.string :href
      t.string :title
      t.string :icon
      t.timestamps
    end    
  end
end
