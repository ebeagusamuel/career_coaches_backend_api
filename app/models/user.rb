class User < ApplicationRecord
  has_secure_password

  has_many :appointments
  has_many :coaches, through: :appointments

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password_digest, presence: true
end
