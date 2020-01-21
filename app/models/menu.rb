class Menu < ApplicationRecord
  validates :image, presence: true
  validates :name, presence: true
  validates :price, presence: true
  validates :commitment, presence: true
end
