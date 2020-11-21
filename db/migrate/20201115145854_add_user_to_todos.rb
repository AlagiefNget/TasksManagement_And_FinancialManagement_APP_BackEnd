class AddUserToTodos < ActiveRecord::Migration[6.0]
  def change
    add_column :todos, :user, :integer
  end
end
