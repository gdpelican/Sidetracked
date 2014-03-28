class CreateContactMethods < ActiveRecord::Migration
  def change
    create_table :contact_methods do |t|
      t.string :name
      t.string :value
      t.timestamps
    end
  end
end
