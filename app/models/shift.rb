class Shift < ApplicationRecord

  validates :name, :start_at, :end_at, presence: true
  validate :shift_time
  belongs_to :restaurant

  private
  def shift_time
    errors.add(:base, 'end time cannot be less than start time') if end_at < start_at
  end
end
