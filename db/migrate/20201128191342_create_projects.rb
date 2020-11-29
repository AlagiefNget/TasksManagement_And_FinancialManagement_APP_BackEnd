class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :due_date
      t.string :client_name
      t.string :status
      t.text :description
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
