class CreateContactChannels < ActiveRecord::Migration[6.0]
  def change
    create_table :contact_channels do |t|
      t.string :name
      t.string :label
      t.string :value
      t.references :vendor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
