class Shift < ApplicationRecord
  attr_accessor :start_time, :end_time

  validates :name, :start_at, :end_at, presence: true
  validate :shift_time
  before_validation :set_shift_time
  belongs_to :restaurant

  private

  def set_shift_time
    self.start_at = start_time.to_datetime.seconds_since_midnight if start_time.present?
    self.end_at = end_time.to_datetime.seconds_since_midnight if end_time.present?
  end

  def shift_time
    errors.add(:base, 'end time cannot be less than start time') if end_at < start_at
  end
end
