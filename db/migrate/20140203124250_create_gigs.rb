class CreateGigs < ActiveRecord::Migration
  def change
    create_table :gigs do |t|
      t.string :name
      t.string :city
      t.string :state
      t.string :address
      t.text :description
      t.datetime :first_performance
      t.datetime :last_performance
      
      t.timestamps
    end
  end
end
