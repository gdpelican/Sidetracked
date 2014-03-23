module Expandable
  extend ActiveSupport::Concern
  
  VISIBLE_COUNT = 4
  
  included do
    scope :visible, -> { limit VISIBLE_COUNT }
    scope :hidden, -> { offset VISIBLE_COUNT }
  end
  
end
