class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table(:users) do |t|
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end

    add_column(:users, :username, :string, limit: 20, null: false)
    add_column(:users, :email, :email, null: false)
    add_column(:users, :password, :string, limit: 64, null: false)
    add_column(:users, :is_email_validated, :boolean)
  end
end
