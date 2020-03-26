class AddLocationToVendor < ActiveRecord::Migration[6.0]
  def change
    add_reference :vendors, :location, foreign_key: true
  end
end
