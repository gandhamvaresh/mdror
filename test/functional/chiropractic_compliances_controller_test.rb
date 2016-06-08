require 'test_helper'

class ChiropracticCompliancesControllerTest < ActionController::TestCase
  setup do
    @chiropractic_compliance = chiropractic_compliances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chiropractic_compliances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chiropractic_compliance" do
    assert_difference('ChiropracticCompliance.count') do
      post :create, chiropractic_compliance: @chiropractic_compliance.attributes
    end

    assert_redirected_to chiropractic_compliance_path(assigns(:chiropractic_compliance))
  end

  test "should show chiropractic_compliance" do
    get :show, id: @chiropractic_compliance.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @chiropractic_compliance.to_param
    assert_response :success
  end

  test "should update chiropractic_compliance" do
    put :update, id: @chiropractic_compliance.to_param, chiropractic_compliance: @chiropractic_compliance.attributes
    assert_redirected_to chiropractic_compliance_path(assigns(:chiropractic_compliance))
  end

  test "should destroy chiropractic_compliance" do
    assert_difference('ChiropracticCompliance.count', -1) do
      delete :destroy, id: @chiropractic_compliance.to_param
    end

    assert_redirected_to chiropractic_compliances_path
  end
end
