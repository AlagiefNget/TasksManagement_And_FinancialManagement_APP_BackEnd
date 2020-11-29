class AddAmountBalanceToProject < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :amount, :float
    add_column :projects, :balance, :float
  end
end
