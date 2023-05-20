class CategoryTransaction < ApplicationRecord
  belongs_to :category
  belongs_to :entity
end
