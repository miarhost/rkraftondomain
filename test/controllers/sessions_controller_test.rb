require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should prompt for login" do
    get new_user_registration_path
    assert_response :success
  end

end


