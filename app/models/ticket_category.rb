class TicketCategory < ApplicationRecord
  has_many :ticket

  validates :category_name, presence: true, length: { maximum: 50 }
end
