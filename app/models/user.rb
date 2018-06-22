class User < ApplicationRecord

  # 普通1卖家2专家3
  scope :sellers, -> { where(role: '2') }
  scope :professionals, -> { where(role: '3') }

  GENDER = ["女", "男"]

  def gender_value
  end

  def gender_text
  end
end
