class Ticket < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :ticket_category, optional: true
  belongs_to :ticket_status, optional: true

  default_scope -> { order(created_at: :desc) }

  validates :client_name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A\S+@.+\.\S+\z/i
  validates :client_email, presence: true, length: { maximum: 100 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }


  def self.generate_reference
      gen = (1..3).map { ('A'..'Z').to_a[rand(0..25)]} << ['-'] << SecureRandom.hex(1) << ['-'] << (1..3).map { ('A'..'Z').to_a[rand(0..25)]} << ['-'] << SecureRandom.hex(1) << ['-'] << (1..3).map { ('A'..'Z').to_a[rand(0..25)]}
      return gen.join.upcase
  end
end
