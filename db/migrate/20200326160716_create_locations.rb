class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :street
      t.string :town
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
