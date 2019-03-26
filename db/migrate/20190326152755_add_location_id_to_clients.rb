class AddLocationIdToClients < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :location_id, :integer
  end
end
