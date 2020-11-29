class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :address
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
