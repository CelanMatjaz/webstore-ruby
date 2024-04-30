class CreateCardInfos < ActiveRecord::Migration[7.1]
  def change
    create_table(:card_infos) do |t|
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end

    add_column(:card_infos, :card_number, :numeric, precision: 16, scale: 0)
    add_column(:card_infos, :expiry_date, :numeric, precision: 2, scale: 2)
  end
end
