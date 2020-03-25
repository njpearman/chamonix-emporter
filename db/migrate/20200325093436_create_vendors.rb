class CreateVendors < ActiveRecord::Migration[6.0]
  def change
    create_table :vendors do |t|
      t.string :name
      t.boolean :delivers

      t.timestamps
    end
  end
end
