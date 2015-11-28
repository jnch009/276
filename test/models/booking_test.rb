require 'test_helper'

class BookingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:matthew)
    @booking = @user.bookings.build(FirstName: "Matthew",LastName: "Crawford",Phone: "7788683315",Time: "6:00")
  end
  
  test "should be valid" do
    assert @booking.valid?
  end

  test "user id should be present" do
    @booking.user_id = nil
    assert_not @booking.valid?
  end
  
  test "FirstName should be present" do
    @booking.FirstName = "   "
    assert_not @booking.valid?
  end
  
  test "LastName should be present" do
    @booking.LastName = "   "
    assert_not @booking.valid?
  end

  test "Phone should be present" do
    @booking.Phone = "   "
    assert_not @booking.valid?
  end

  test "valid phone number" do
    @booking.Phone = "a" * 141
    assert_not @booking.valid?
  end
end
