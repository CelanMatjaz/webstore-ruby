class Product < ApplicationRecord
  has_many :product_prices

  def get_price(currency)
    product_prices.find_by(currency:).price
  end

  def get_symbol(currency)
    product_prices.find_by(currency:).symbol
  end

  def get_price_and_symbol(currency)
    p = product_prices.find_by(currency:)
    { price: p.price, symbol: p.symbol }
  end
end
