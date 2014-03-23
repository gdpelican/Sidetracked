class Gig < ActiveRecord::Base
  include Expandable
  
  has_many :performances
  belongs_to :act
  belongs_to :gig_entry
  
  before_save :update_gig_entry
  
  scope :with_gigs, -> { select('gigs.*')
                        .joins('inner join performances on gigs.id = performances.gig_id') }
  scope :future, -> { with_gigs.where('performances.date >= ?', Date.today.beginning_of_day).uniq }
  scope :past, -> {   where('NOT id = ANY (\'{?}\')', send(:future).pluck(:id)) rescue all }
  
  def date_range
    performances.minimum(:date)..performances.maximum(:date)
  end
  
  private
  
  def update_gig_entry
    self.gig_entry = GigEntry.build(self)
  end
end