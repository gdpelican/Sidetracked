class AddActIdToGigs < ActiveRecord::Migration
  def change
    add_column :gigs, :act_id, :integer
    add_column :gigs, :gig_entry_id, :integer
  end
end
