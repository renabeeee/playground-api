require "test_helper"

class PasswordControllerTest < ActionDispatch::IntegrationTest
  test "should get Reset" do
    get password_Reset_url
    assert_response :success
  end
end
