class Vendor < ApplicationRecord
  belongs_to :location
  has_many :weekday_time_ranges
  
  def open_today?
    today = Time.now.strftime("%A")
    weekday_time_ranges.where(day: today).any?
  end

  def hours_for_today
    today = Time.now.strftime("%A")
    weekday_time_ranges.where(day: today).order(start_in_mins: :asc).map do |range|
      "#{format_time range.start_in_mins} - #{format_time range.end_in_mins}"
    end
  end
   
  private

  def format_time(minutes_of_day)
    [minutes_of_day / 60,
     "%02d" % (minutes_of_day % 60)].join "h"
  end
end