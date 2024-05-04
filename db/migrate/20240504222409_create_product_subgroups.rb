class CreateProductSubgroups < ActiveRecord::Migration[7.1]
  def change
    create_table :product_subgroups do |t|
      t.timestamps
    end

    add_column(:product_subgroups, :name, :string, null: false, default: '')

    add_reference(:product_subgroups, :product_group, foreign_key: true)
  end
end
