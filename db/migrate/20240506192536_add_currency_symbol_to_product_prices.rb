class AddCurrencySymbolToProductPrices < ActiveRecord::Migration[7.1]
  def change
    add_column(:product_prices, :symbol, :string, null: false, default: '')
  end
end
