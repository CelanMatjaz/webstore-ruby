class RemoveTimestampsFromProductPrices < ActiveRecord::Migration[7.1]
  def change
    remove_timestamps(:product_prices)
  end
end
