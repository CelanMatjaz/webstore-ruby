class CreateAccountSettings < ActiveRecord::Migration[7.1]
  def change
    create_table(:account_settings) do |t|
      t.timestamps
    end

    add_column(:account_settings, :display_name, :string, null: false)
    add_column(:account_settings, :currency, :string, null: false)

    add_reference(:account_settings, :user, foreign_key: true)
  end
end
