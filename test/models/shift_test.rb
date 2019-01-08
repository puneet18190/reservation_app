require 'test_helper'

class ShiftTest < ActiveSupport::TestCase
  setup do
    @restaurant = create(:restaurant)
    @tables = create_list(:table, 2, restaurant: @restaurant)
  end

  test 'validate name and shift timing' do
    shift = build(:shift, restaurant: @restaurant)

    shift.name = nil
    assert_not shift.valid?
    assert_equal "can't be blank", shift.errors[:name].first

    shift.name = 'Lunch'
    assert shift.valid?

    shift.end_at = 0
    assert_not shift.valid?
    assert_equal 'end time cannot be less than start time', shift.errors[:base].first

    shift.end_at = 54000
    assert shift.valid?
    assert shift.save
  end
end
