class LunchMenu < ApplicationRecord
  has_one_attached :lunch_image
  validates :name, presence: true
  validates :price, presence: true
  validates :allergy, presence: true
  validates :commitment, presence: true
end
