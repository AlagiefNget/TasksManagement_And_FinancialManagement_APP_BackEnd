class RemoveUserFromTodos < ActiveRecord::Migration[6.0]
  def change
    remove_column :todos, :user, :string
  end
end
