class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :name
      t.string :address
      t.string :insurance
      t.integer :age
      t.integer :patient, :gender, :integer
      t.timestamps null: false
    end
  end
end
