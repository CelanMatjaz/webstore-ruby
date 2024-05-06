class AddProductDescription < ActiveRecord::Migration[7.1]
  def change
    add_column(:products, :description, :text, default: "", null: false)
  end
end
