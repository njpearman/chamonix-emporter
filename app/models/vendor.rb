class Vendor < ApplicationRecord
  belongs_to :location
  has_many :weekday_time_ranges, dependent: :destroy
  has_many :contact_channels, dependent: :destroy
  
  scope :delivers, -> { where(delivers: true) }
  scope :on, ->(day) { joins(:weekday_time_ranges).merge(WeekdayTimeRange.on(day)) }
  
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
   
  def self.scopes_for(filters:)
    filter_scopes = {
      "open" => ->(scoped) { scoped.on(Time.now.strftime("%A")) },
      "delivers" => ->(scoped) { scoped.delivers }
    }

    unhandled_filters = filters - filter_scopes.keys

    raise "Unhandled vendor filters [#{unhandled_filters}]" if unhandled_filters.any?

    filters.inject(Vendor.all) do |scope, filter|
      filter_scopes[filter].call(scope)
    end
  end

  private

  def format_time(minutes_of_day)
    [minutes_of_day / 60,
     "%02d" % (minutes_of_day % 60)].join "h"
  end
end
