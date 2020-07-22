class History < ApplicationRecord
  belongs_to :ticket

  default_scope -> { order(created_at: :desc) }

  validates :ticket_id, presence: true
  validates :header, presence: true, length: { maximum: 100 }
  validates :content, presence: true, length: { maximum: 200 }
end
