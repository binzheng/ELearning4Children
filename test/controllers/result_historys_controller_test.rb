require 'test_helper'

class ResultHistorysControllerTest < ActionDispatch::IntegrationTest
  test "should get showHistList" do
    get result_historys_showHistList_url
    assert_response :success
  end

end
