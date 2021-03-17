class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.string :name
      t.date :date
      t.float :actual_amount
      t.float :budgeted_amount
      t.float :difference
      t.string :account
      t.references :expense_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
