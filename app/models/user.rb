class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :email, presence: true
  validates :email, uniqueness: true, allow_blank: true
  validates :password, presence: true
  validates :password, length: { in: 4..72 }, allow_blank: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
end
