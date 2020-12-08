class AddCliendidToCharge < ActiveRecord::Migration[6.0]
  def change
    add_reference :charges, :client, null: false, foreign_key: true
  end
end
