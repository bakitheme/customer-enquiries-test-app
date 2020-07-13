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
end
