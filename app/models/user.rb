class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
  validates :name, presence: true 
  validates :member, default: false
  has_secure_password
  validates :password, presence: true, length: {minimum: 6}

end
