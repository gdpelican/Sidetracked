class Performance < ActiveRecord::Base
  include Expandable
  
  has_one :gig_entry, through: :gig
  belongs_to :gig
  alias_attribute :start_time, :date
    
  scope :future, -> { includes(:gig).where('date >= ?', Date.today) }
  scope :past, -> { includes(:gig).where('date < ?', Date.today) }
  scope :in_month, ->(month) { where('date between ? and ?', month.beginning_of_month, month.end_of_month) }

  def to_s
    date.strftime '%Y-%m-%d'
  end

  def self.by_gig_id(gig_id)
    case gig_id
    when 0 then   none
    when nil then all
    else          where gig_id: gig_id.to_i
    end
  end

end
