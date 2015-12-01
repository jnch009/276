require 'test_helper'

class SearchTest < ActiveSupport::TestCase

  def setup
    @search = Search.new(location: "asdf")
  end

  test "location should be present" do
    location = @search.location = " " * 3
    assert_not @search.valid?
  end
end
