class Ticket < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :ticket_category, optional: true
  belongs_to :ticket_status, optional: true

  attr_accessor :activation_token

  before_save { self.client_email = client_email.downcase }
  before_create :create_activation_digest

  default_scope -> { order(created_at: :desc) }

  validates :client_name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A\S+@.+\.\S+\z/i
  validates :client_email, presence: true, length: { maximum: 100 },
                    format: { with: VALID_EMAIL_REGEX },


  def self.generate_reference
    gen = (1..3).map { ('A'..'Z').to_a[rand(0..25)]} <<
    ['-'] << SecureRandom.hex(1) <<
    ['-'] << (1..3).map { ('A'..'Z').to_a[rand(0..25)]} <<
    ['-'] << SecureRandom.hex(1) <<
    ['-'] << (1..3).map { ('A'..'Z').to_a[rand(0..25)]}

    return gen.join.upcase
  end

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def activate
    update_columns(activated: true,
                   activated_at: Time.zone.now)
  end

  def send_activation_email
    TicketMailer.ticket_activation(self).deliver_now
  end

  def active?(token)
    return false if activation_digest.nil?
    BCrypt::Password.new(activation_digest).is_password?(token)
  end

  private

  def create_activation_digest
    self.activation_token = Ticket.new_token
    self.activation_digest = Ticket.digest(activation_token)
  end
end
