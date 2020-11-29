class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.string :currency
      t.float :amount
      t.float :balance
      t.date :payment_date
      t.string :project_name
      t.string :client_name
      t.references :charge, null: false, foreign_key: true

      t.timestamps
    end
  end
end
