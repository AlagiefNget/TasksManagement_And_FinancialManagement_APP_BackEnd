class CreateIncomeCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :income_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
