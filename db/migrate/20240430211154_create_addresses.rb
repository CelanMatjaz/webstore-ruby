class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table(:addresses) do |t|
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end

    add_column(:addresses, :country, :string, limit: 32, null: false)
    add_column(:addresses, :city, :string, limit: 64, null: false)
    add_column(:addresses, :zip_code, :numeric, precision: 20, scale: 0, null: false)
    add_column(:addresses, :street, :string, limit: 64, null: false)
    add_column(:addresses, :house_number, :numeric, precision: 20, scale: 0, null: false)
  end
end
