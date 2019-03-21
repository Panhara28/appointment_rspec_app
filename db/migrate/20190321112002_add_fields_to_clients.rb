class AddFieldsToClients < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :name, :string
    add_column :clients, :address, :string
    add_column :clients, :phone, :string
  end
end
