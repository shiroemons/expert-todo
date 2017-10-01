class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :email, presence: true
  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validates :email, uniqueness: true
end
