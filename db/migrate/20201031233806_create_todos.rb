class CreateTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :todos do |t|
      t.string :task
      t.time :scheduled_at
      t.date :date
      t.string :status

      t.timestamps
    end
  end
end
