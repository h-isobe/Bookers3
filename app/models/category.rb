class Category < ApplicationRecord
  has_many :post_category_relations
  has_many :books, through: :post_category_relations
end
