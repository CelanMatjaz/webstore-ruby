class CreateProductPrices < ActiveRecord::Migration[7.1]
  def change
    create_table(:product_prices) do |t|
      t.timestamps
    end

    add_reference(:product_prices, :product, index: true, foreign_key: true)
    add_column(:product_prices, :price, :numeric, precision: 10, scale: 2, null: false)
    add_column(:product_prices, :currency, :string, null: false)

    add_index(:product_prices, %i[currency product_id], unique: true)
    add_check_constraint(:product_prices, "currency IN ('USD', 'EUR', 'GBP')", name: 'currency_check')
  end
end
