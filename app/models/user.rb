
class User < ApplicationRecord
  has_secure_password

  # Validation
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  has_many :collections
  has_many :books, through: :collections
  has_many :bookmarks
end
