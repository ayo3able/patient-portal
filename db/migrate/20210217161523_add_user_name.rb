class AddUserName < ActiveRecord::Migration
  def change
    add_column :physicians, :username, :string
  end
end
