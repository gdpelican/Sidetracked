class AddBoolToLinks < ActiveRecord::Migration
  def change
    add_column :links, :on_contact, :boolean, default: false
  end
end
