class MorningMenu < ApplicationRecord
  has_one_attached :morning_image
  validates :name, presence: true
  validates :price, presence: true
  validates :allergy, presence: true
  validates :commitment, presence: true
end
