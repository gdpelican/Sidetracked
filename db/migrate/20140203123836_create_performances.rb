class CreatePerformances < ActiveRecord::Migration
  def change
    create_table :performances do |t|
      t.datetime :date 
      t.belongs_to :gig     
      t.timestamps
    end
  end
end
