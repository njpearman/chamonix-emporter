class Location < ApplicationRecord
  def position
    { lng: longitude, lat: latitude }
  end
end
