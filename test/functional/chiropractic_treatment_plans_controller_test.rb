require 'test_helper'

class ChiropracticTreatmentPlansControllerTest < ActionController::TestCase
  setup do
    @chiropractic_treatment_plan = chiropractic_treatment_plans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chiropractic_treatment_plans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chiropractic_treatment_plan" do
    assert_difference('ChiropracticTreatmentPlan.count') do
      post :create, chiropractic_treatment_plan: @chiropractic_treatment_plan.attributes
    end

    assert_redirected_to chiropractic_treatment_plan_path(assigns(:chiropractic_treatment_plan))
  end

  test "should show chiropractic_treatment_plan" do
    get :show, id: @chiropractic_treatment_plan.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @chiropractic_treatment_plan.to_param
    assert_response :success
  end

  test "should update chiropractic_treatment_plan" do
    put :update, id: @chiropractic_treatment_plan.to_param, chiropractic_treatment_plan: @chiropractic_treatment_plan.attributes
    assert_redirected_to chiropractic_treatment_plan_path(assigns(:chiropractic_treatment_plan))
  end

  test "should destroy chiropractic_treatment_plan" do
    assert_difference('ChiropracticTreatmentPlan.count', -1) do
      delete :destroy, id: @chiropractic_treatment_plan.to_param
    end

    assert_redirected_to chiropractic_treatment_plans_path
  end
end
