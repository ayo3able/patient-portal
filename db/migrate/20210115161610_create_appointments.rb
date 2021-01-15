class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.belongs_to :physician
      t.belongs_to :patient
      t.datetime :appointment_date
      t.timestamps null: false
    end
  end
end
