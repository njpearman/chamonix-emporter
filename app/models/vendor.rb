class Vendor < ApplicationRecord
  FILTER_SCOPES = {
    "open" => ->(scoped) { scoped.open_today },
    "delivers" => ->(scoped) { scoped.delivers }
  }

  belongs_to :location
  has_many :weekday_time_ranges, dependent: :destroy
  has_many :contact_channels, dependent: :destroy
  
  scope :delivers, -> { where(delivers: true) }
  scope :open_on, ->(day) { joins(:weekday_time_ranges).merge(WeekdayTimeRange.on(day)).distinct }
  scope :open_today, -> { open_on(Time.now.strftime("%A")) }
  
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

  def open_on?(day)
    @open_days ||= weekday_time_ranges.select('day').distinct.pluck(:day)
    @open_days.include?(day)
  end
   
  def self.filtered_by(filters:)
    unhandled_filters = filters - FILTER_SCOPES.keys

    raise "Unhandled vendor filters [#{unhandled_filters.join(",")}]" if unhandled_filters.any?

    filters.inject(Vendor.all) do |composite_scope, filter|
      FILTER_SCOPES[filter].call(composite_scope)
    end
  end

  private

  def format_time(minutes_of_day)
    [minutes_of_day / 60,
     "%02d" % (minutes_of_day % 60)].join "h"
  end
end
