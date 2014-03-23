class CreateActs < ActiveRecord::Migration
  def change
    create_table :acts do |t|
      t.string :title
      t.string :blurb
      t.string :source
      t.has_attached_file :avatar
      t.timestamps
    end
  end
end
