class Performance < ActiveRecord::Base
  include Expandable
  
  has_one :gig_entry, through: :gig
  belongs_to :gig
  alias_attribute :start_time, :date
  
  after_save :update_gig_entry
  
  scope :future, -> { includes(:gig).where('date >= ?', Date.today) }
  scope :past, -> { includes(:gig).where('date < ?', Date.today) }
  scope :in_month, ->(month) { where('date between ? and ?', month.beginning_of_month, month.end_of_month) }

  def to_s
    date.strftime '%Y-%m-%d'
  end

  def self.collection(gig, *dates)
    dates.map { |date| Performance.new(gig_id: gig.id, date: date) }
  end

  def self.by_gig_id(gig_id)
    case gig_id
    when 0 then   none
    when nil then all
    else          where gig_id: gig_id.to_i
    end
  end

  private
  
  def update_gig_entry
    self.gig.save
  end

end
