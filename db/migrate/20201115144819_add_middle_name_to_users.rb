class AddMiddleNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :middle_name, :string
  end
end
