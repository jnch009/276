require 'test_helper'

class SearchTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "location filled" do
    query = Search.new()
    query.location = "Vancouver,BC";
    #query.restname = "blah"
    assert query.valid?
  end
end
