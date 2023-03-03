class Product < ApplicationRecord
  has_and_belongs_to_many :keywords
  belongs_to :categories

end
