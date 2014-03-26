class Performance < ActiveRecord::Base
  include Expandable
  
  has_one :gig_entry, through: :gig
  belongs_to :gig
  alias_attribute :start_time, :date
  
  after_save :update_gig_entry
  
  scope :future, -> { includes(:gig).where('date >= ?', Date.today) }
  scope :past, -> { includes(:gig).where('date < ?', Date.today) }
  scope :in_month, ->(month) { where('date between ? and ?', month.beginning_of_month, month.end_of_month) }

  def self.collection(*dates)
    dates.map { |date| Performance.new(date: date) }
  end

  private
  
  def update_gig_entry
    self.gig.save
  end

end
