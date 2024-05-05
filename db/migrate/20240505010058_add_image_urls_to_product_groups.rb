class AddImageUrlsToProductGroups < ActiveRecord::Migration[7.1]
  def change
    add_column(:product_groups, :image_url, :string, null: false, default: '')
    add_column(:product_subgroups, :image_url, :string, null: false, default: '')
  end
end
