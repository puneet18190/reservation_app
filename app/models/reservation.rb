class Reservation < ApplicationRecord
  belongs_to :restaurant
  belongs_to :table
  belongs_to :shift
  belongs_to :guest

  validates :guest_count, :reservation_at, presence: true
  validates_numericality_of :guest_count, :greater_than_or_equal_to => :table_min, :less_than_or_equal_to => :table_max

  validate :reservation_at_shift
  validate :validate_same_restaurant

  after_create_commit :send_emails

  def table_min
    table.min_capacity
  end

  def table_max
    table.max_capacity
  end

  private

  def send_emails
    ReservationMailer.send_reservation_details_to_guest(guest, self).deliver_now
    ReservationMailer.send_reservation_details_to_restaurant(guest, self).deliver_now
  end

  def reservation_at_shift
    if reservation_at.present? && shift.present? && (reservation_at_changed? || shift_id_changed?)
      total_seconds = reservation_at.to_i % 86400
      errors.add(:reservation_at, 'not lie within selected shift timings') if shift.start_at > total_seconds || shift.end_at < total_seconds
    end
  end

  def validate_same_restaurant
    if table.present? && shift.present? && (table_id_changed? || shift_id_changed?)
      errors.add(:base, 'table and shift must belong to same restaurant') unless table.restaurant_id == shift.restaurant_id
    end
  end
end
