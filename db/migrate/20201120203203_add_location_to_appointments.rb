class AddLocationToAppointments < ActiveRecord::Migration[6.0]
  def change
    add_column :appointments, :location, :string
  end
end
