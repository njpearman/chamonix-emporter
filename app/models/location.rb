class Location < ApplicationRecord
  after_validation :geocode

  geocoded_by :address

  private

  def address
    [street, town, "France"].join ", "
  end
end
