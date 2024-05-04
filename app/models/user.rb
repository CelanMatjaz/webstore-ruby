class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true, length: { minimum: 5, maximum: 20 }
  validates :email, presence: true, uniqueness: true
  validates :password, confirmation: true, length: { minimum: 8, maximum: 20 }
  validates :password_confirmation, presence: true, length: { minimum: 8, maximum: 20 }

  has_secure_password
end
