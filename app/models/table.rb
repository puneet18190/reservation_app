class Table < ApplicationRecord
  belongs_to :restaurant

  validates :name, :min_capacity, :max_capacity, presence: true
  validates :min_capacity, :max_capacity, numericality: { only_integer: true, greater_than: 0 }

end
