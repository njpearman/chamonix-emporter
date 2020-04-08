class AddInformationToVendors < ActiveRecord::Migration[6.0]
  def change
    add_column :vendors, :information, :text
  end
end
