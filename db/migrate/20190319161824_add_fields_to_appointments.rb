class AddFieldsToAppointments < ActiveRecord::Migration[5.1]
  def change
    add_column :appointments, :appointment_date, :datetime
    add_column :appointments, :duration, :integer
    add_column :appointments, :price, :float
  end
end
