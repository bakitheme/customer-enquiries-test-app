class TicketStatus < ApplicationRecord
  has_many :ticket

  validates :status_name, presence: true, length: { maximum: 50 }
end
