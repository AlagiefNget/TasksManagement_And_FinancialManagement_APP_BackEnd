class CreateIncomes < ActiveRecord::Migration[6.0]
  def change
    create_table :incomes do |t|
      t.float :amount
      t.date :date
      t.references :income_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
