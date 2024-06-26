class CreateProductGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :product_groups do |t|
      t.timestamps
    end

    add_column(:product_groups, :name, :string, null: false, default: '')
    add_index(:product_groups, :name, unique: true)
  end
end
