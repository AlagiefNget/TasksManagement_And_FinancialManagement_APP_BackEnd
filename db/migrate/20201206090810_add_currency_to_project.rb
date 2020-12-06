class AddCurrencyToProject < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :currency, :string
  end
end
