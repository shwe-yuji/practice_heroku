class Book < ApplicationRecord
  validates :title, presence: true
  validates :price, presence: true
  validates :memo, presence: true
end
