class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table(:products) do |t|
      t.timestamps
    end

    add_column(:products, :name, :string, limit: 32, null: false)
    add_column(:products, :quantity, :integer)
    add_column(:products, :image_url, :string, limit: 64, null: true)
  end
end
