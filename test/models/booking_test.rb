require 'test_helper'

class BookingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:matthew)
    @booking = @user.bookings.build(Time: "6:00")
  end
  
  test "should be valid" do
    assert @booking.valid?
  end

  test "user id should be present" do
    @booking.user_id = nil
    assert_not @booking.valid?
  end

  test "associated bookings should be destroyed" do
    @user.save
    @user.bookings.create!(Time: "6:00")
    assert_difference 'Booking.count', -1 do
      @user.destroy
    end
  end
end
