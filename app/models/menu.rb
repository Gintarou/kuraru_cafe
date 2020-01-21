class Menu < ApplicationRecord
  has_one_attached :image
  validates :name, presence: true
  validates :price, presence: true
  validates :commitment, presence: true
  validates :allergy, presence: true
end
