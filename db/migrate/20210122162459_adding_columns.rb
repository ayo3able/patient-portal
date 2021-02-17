class AddingColumns < ActiveRecord::Migration
  def change
        add_column :appointments, :completed, :boolean
        add_column :appointments, :appt_time, :time

  end
end
