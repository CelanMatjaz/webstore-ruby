class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table(:users) do |t|
      t.timestamps
    end

    add_column(:users, :username, :string, limit: 20, null: false)
    add_column(:users, :email, :string, null: false)
    add_column(:users, :password_digest, :string, limit: 64, null: false)
    add_column(:users, :is_email_validated, :boolean, default: false, null: false)
    add_column(:users, :is_admin, :boolean, default: false, null: false)
  end
end
