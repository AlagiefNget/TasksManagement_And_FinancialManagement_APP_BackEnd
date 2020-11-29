class CreateCharges < ActiveRecord::Migration[6.0]
  def change
    create_table :charges do |t|
      t.string :currency
      t.float :amount
      t.float :balance
      t.date :due_date
      t.string :project_name
      t.string :client_name
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
