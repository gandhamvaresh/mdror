require 'test_helper'

class ReportsControllerTest < ActionController::TestCase
  test "should get weekly_summary" do
    get :weekly_summary
    assert_response :success
  end

  test "should get monthly_summary" do
    get :monthly_summary
    assert_response :success
  end

end
