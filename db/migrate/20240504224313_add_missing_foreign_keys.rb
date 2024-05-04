class AddMissingForeignKeys < ActiveRecord::Migration[7.1]
  def change
    add_reference(:addresses, :user, foreign_key: true)
    add_reference(:card_infos, :user, foreign_key: true)    
    add_reference(:products, :product_subgroup, foreign_key: true)
  end
end
