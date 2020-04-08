class WeekdayTimeRange < ApplicationRecord
  belongs_to :vendor

  scope :on, ->(day) { where(day: day) }
end
