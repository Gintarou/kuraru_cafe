class DrinkMenu < ApplicationRecord
  has_one_attached :drink_image
  validates :name, presence: true
  validates :price, presence: true
  validates :allergy, presence: true
  validates :commitment, presence: true
end
