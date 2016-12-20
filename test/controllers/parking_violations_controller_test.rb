require 'test_helper'

class ParkingViolationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get parking_violations_new_url
    assert_response :success
  end

end
