class Order < ApplicationRecord
  belongs_to :products
  belongs_to :transactions
end
