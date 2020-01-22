class LunchMenu < ApplicationRecord
  has_one_attached :lunch_image
  validates :name, presence: true
  validates :price, presence: true
  validates :allergy, presence: true
  validates :commitment, presence: true

  # 渡された文字列のハッシュ値を返す
  def LunchMenu.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
