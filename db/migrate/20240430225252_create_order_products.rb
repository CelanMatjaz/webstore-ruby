class CreateOrderProducts < ActiveRecord::Migration[7.1]
  def change
    create_table(:order_products) do |t|
      t.timestamps
    end

    add_reference(:order_products, :order, index: false, foreign_key: true)
    add_reference(:order_products, :product, index: false, foreign_key: true)

    add_column(:order_products, :quantity, :integer, default: 1, null: false)
    add_column(:order_products, :price, :numeric, precision: 10, scale: 2, null: false)
    add_column(:order_products, :currency, :string, null: false)

    add_check_constraint(:order_products, "currency IN ('USD', 'EUR', 'GBP')", name: 'currency_check')
  end
end
