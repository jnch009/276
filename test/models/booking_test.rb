require 'test_helper'

class BookingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:matthew)
    @booking = Booking.new(FirstName: "Matthew",LastName: "Crawford",Phone: "7788683315",Time: "6:00",user_id: @user.id)
  end
  
  test "should be valid" do
    assert @booking.valid?
  end

  test "user id should be present" do
    @booking.user_id = nil
    assert_not @booking.valid?
  end
end
