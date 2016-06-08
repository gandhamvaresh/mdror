require 'test_helper'

class ChiropracticTreatmentsControllerTest < ActionController::TestCase
  setup do
    @chiropractic_treatment = chiropractic_treatments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chiropractic_treatments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chiropractic_treatment" do
    assert_difference('ChiropracticTreatment.count') do
      post :create, chiropractic_treatment: @chiropractic_treatment.attributes
    end

    assert_redirected_to chiropractic_treatment_path(assigns(:chiropractic_treatment))
  end

  test "should show chiropractic_treatment" do
    get :show, id: @chiropractic_treatment.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @chiropractic_treatment.to_param
    assert_response :success
  end

  test "should update chiropractic_treatment" do
    put :update, id: @chiropractic_treatment.to_param, chiropractic_treatment: @chiropractic_treatment.attributes
    assert_redirected_to chiropractic_treatment_path(assigns(:chiropractic_treatment))
  end

  test "should destroy chiropractic_treatment" do
    assert_difference('ChiropracticTreatment.count', -1) do
      delete :destroy, id: @chiropractic_treatment.to_param
    end

    assert_redirected_to chiropractic_treatments_path
  end
end
