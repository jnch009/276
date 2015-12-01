require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  
  def setup
    @review = Review.new(body: "asdf")
  end
  
  test "should be valid" do
    assert @review.valid?
  end
  
  test "review should be present (non-blank)" do
    body = @review.body = " " * 5
    assert_not @review.valid?
  end
  
  test "review should not be over 1000 letters" do
    body = @review.body = "a" * 1001
    assert_not @review.valid?
  end
end
