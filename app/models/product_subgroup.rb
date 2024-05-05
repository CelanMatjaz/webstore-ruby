class ProductSubgroup < ApplicationRecord
  belongs_to :product_group
  has_many :products
end
