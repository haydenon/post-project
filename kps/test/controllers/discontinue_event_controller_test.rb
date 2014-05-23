require 'test_helper'

class DiscontinueEventControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

end
