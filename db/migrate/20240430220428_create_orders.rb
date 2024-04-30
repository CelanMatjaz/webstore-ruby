class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.timestamps
    end

    add_reference(:orders, :user, index: true, foreign_key: true)
    add_reference(:orders, :address, index: false, foreign_key: true)

    add_column(:orders, :date, :datetime)
  end
end
