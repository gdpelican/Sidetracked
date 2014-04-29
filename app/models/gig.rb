class Gig < ActiveRecord::Base
  include Expandable
  
  has_many :performances, autosave: true
  belongs_to :act
  belongs_to :gig_entry

  before_save :update_gig_entry
  before_save :update_performance_data
  before_destroy :destroy_gig_entry
  
  default_scope { order(:first_performance) } 
  
  scope :future, -> { where('last_performance >= ?', Date.today.beginning_of_day) }
  scope :past, -> {   where('last_performance < ?',  Date.today.beginning_of_day) }
  
  def self.find_by_entry(id)
    where(gig_entry_id: id).first || new 
  end
  
  def update_performances(dates)
    performances.delete_if { |perf_date| dates.include? perf_date }
                .each        &:mark_for_destruction
    dates       .delete_if { |date| date_strings.include? date }
                .each      { |date| performances.build date: date }
    update_performance_data
  end
  
  def date_strings
    performances.map &:to_s
  end
  
  def date_range
    min, max = performances.minimum(:date), performances.maximum(:date)
    return if min.blank? || max.blank?
    
    y, m, d =     min.year == max.year, min.month == max.month, min.day == max.day
    if    y && m && d then "#{format min}"
    elsif y && m      then "#{format min, :day_month} - #{format max, :day_year}"
    elsif y           then "#{format min, :day_month} - #{format max}"
    else                   "#{format min} - #{format max}" end
  end
    
  def format(date, type = :default)
    ord = date.day.ordinalize
    date.strftime case type
    when :day_month then "%b #{ord}"
    when :day_year  then "#{ord}, %Y"
    else                 "%b #{ord}, %Y"
    end
  end

  private
  
  def update_performance_data
    return if performances.empty?
    self.first_performance = performances.minimum :date
    self.last_performance = performances.maximum :date
  end
  
  def update_gig_entry
    self.gig_entry = GigEntry.build(self)
  end
  
  def destroy_gig_entry
    self.gig_entry.destroy
  end
  
end