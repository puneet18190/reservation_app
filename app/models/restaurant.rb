class Restaurant < ApplicationRecord
  validates :name, :email, :phone, presence: true
  validates_uniqueness_of :name
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP, if: :email_changed?
  validates_format_of :phone, with: /\d[0-9]\)*\z/, if: :phone_changed?

  has_many :shifts, dependent: :delete_all
  has_many :tables, dependent: :delete_all
  has_many :reservations, dependent: :delete_all
end
