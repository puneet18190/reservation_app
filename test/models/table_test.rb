require 'test_helper'
require 'pry'

class TableTest < ActiveSupport::TestCase
  setup do
    @restaurant = create(:restaurant)
  end

  test 'validate name and table capacity' do
    table = build(:table, restaurant: @restaurant)

    table.name = nil
    assert_not table.valid?
    assert_equal "can't be blank", table.errors[:name].first

    table.name = 'T-23'
    assert table.valid?

    table.min_capacity = 'abc'
    assert_not table.valid?
    assert_equal 'is not a number', table.errors[:min_capacity].first

    table.min_capacity = -1
    assert_not table.valid?
    assert_equal 'must be greater than 0', table.errors[:min_capacity].first

    table.min_capacity = 1
    assert table.valid?
    assert table.save
  end
end
