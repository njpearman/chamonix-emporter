class CreateWeekdayTimeRanges < ActiveRecord::Migration[6.0]
  def change
    create_table :weekday_time_ranges do |t|
      t.string :day
      t.integer :start_in_mins
      t.integer :end_in_mins
      t.references :vendor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
