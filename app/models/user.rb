class User < ApplicationRecord
  before_save { self.email = email.downcase }

  has_many :ticket

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A\S+@.+\.\S+\z/i
  validates :email, presence: true, length: { maximum: 100 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }

  has_secure_password
end
