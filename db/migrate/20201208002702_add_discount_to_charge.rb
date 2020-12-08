class AddDiscountToCharge < ActiveRecord::Migration[6.0]
  def change
    add_column :charges, :discount, :float
  end
end
