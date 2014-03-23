class AddLinkToGigs < ActiveRecord::Migration
  def change
    add_column :gigs, :link, :string
  end
end
