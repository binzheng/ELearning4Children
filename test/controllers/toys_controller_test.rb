require 'test_helper'

class ToysControllerTest < ActionDispatch::IntegrationTest
  test "should get showList" do
    get toys_showList_url
    assert_response :success
  end

end
