# frozen_string_literal: true

class User < ActiveRecord::Base
  include DeviseTokenAuth::Concerns::User

  PASSWORD_FORMAT = /\A (?=.{8,}) (?=.*\d) (?=.*[a-z]) (?=.*[A-Z]) (?=.*[[:^alnum:]]) /x.freeze

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true, length: { maximum: 64 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  validates :password_confirmation, presence: true, allow_blank: false, if: :password

  validates :first_name, :last_name, presence: true, allow_blank: false

  validate :password_valid?

  enum kind: %i[client admin quality_assurance dev_front dev_back design product_manager]

  before_save :set_full_name

  private

  def set_full_name
    self.full_name = "#{first_name} #{last_name}"
    self
  end

  def password_valid?
    return unless changes[:encrypted_password]

    unless PASSWORD_FORMAT.match(password)
      errors.add(:password, 'format is not valid')
      throw :abort
    end
    true
  end
end
