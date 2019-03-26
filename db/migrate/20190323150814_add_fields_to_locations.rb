class AddFieldsToLocations < ActiveRecord::Migration[5.1]
  def change
    add_column :locations, :nickname, :string
    add_column :locations, :city, :string
    add_column :locations, :street_address, :string
    add_column :locations, :state, :string
    add_column :locations, :zipcode, :string
    add_column :locations, :business_name, :string
  end
end
