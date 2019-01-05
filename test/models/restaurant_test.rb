require 'test_helper'
require 'pry'
class RestaurantTest < ActiveSupport::TestCase
  test 'validate name and email' do
    restaurant = build(:restaurant)
    assert restaurant.valid?
    
    restaurant.name = nil
    assert_not restaurant.valid?
    assert_equal "can't be blank", restaurant.errors[:name].first

    restaurant.name = 'RES1'
    assert restaurant.valid?

    restaurant.email = nil
    assert_not restaurant.valid?
    assert_equal "can't be blank", restaurant.errors[:email].first

    restaurant.email = 'res1@gmail.com'
    assert restaurant.valid?
    assert restaurant.save
  end

  test 'validate format of email' do
    restaurant = create(:restaurant)
    
    restaurant.email = 'res2.gmail.com'
    assert_not restaurant.valid?
    assert_equal 'is invalid', restaurant.errors[:email].first
    
    restaurant.email = 'res2@gmail.com'
    assert restaurant.valid?
  end

  test 'validate format of phone' do
    restaurant = create(:restaurant)
    
    restaurant.phone = 'foo'
    assert_not restaurant.valid?
    assert_equal 'is invalid', restaurant.errors[:phone].first
    
    restaurant.phone = '9876543210'
    assert restaurant.valid?
  end
end
