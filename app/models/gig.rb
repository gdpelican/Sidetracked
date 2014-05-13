class Gig < ActiveRecord::Base
  include Expandable
  
  attr_accessor :dates
  def dates=(value)
    @dates = value.split '|'
  end
  
  has_many :performances, autosave: true
  belongs_to :act
  belongs_to :gig_entry

  before_save :prepare_for_save
  after_destroy :destroy_gig_entry
  
  default_scope { order(:first_performance) } 
  
  scope :future, -> { where('last_performance >= ?', Date.today.beginning_of_day) }
  scope :past, -> {   where('last_performance < ?',  Date.today.beginning_of_day) }
  
  def self.find_by_entry(id)
    where(gig_entry_id: id).first || new 
  end

  def prepare_for_save
    perfs = updated_performances
    if perfs.any?
      self.first_performance = perfs.min
      self.last_performance =  perfs.max
    end
    self.gig_entry = GigEntry.build! self
  end
  
  def date_range
    min, max = self.first_performance, self.last_performance
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
  
  def updated_performances
    return performances unless self.dates
    clear_old_performances if performances.any?
    add_new_performances 
    performances.delete_if(&:marked_for_destruction?).map(&:date)
  end
  
  def clear_old_performances
    performances.delete_if { |perf_date| self.dates.include? perf_date.to_s }
                .each        &:mark_for_destruction  
  end
  
  def add_new_performances
    self.dates  .delete_if { |date| date_strings.include? date }
                .each      { |date| performances.build date: date, gig_id: id }
  end
    
  def date_strings
    performances.map &:to_s
  end

  def destroy_gig_entry
    self.gig_entry.destroy if self.gig_entry
  end
  
end