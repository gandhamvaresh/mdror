require 'test_helper'

class ChiropracticAssessmentsControllerTest < ActionController::TestCase
  setup do
    @chiropractic_assessment = chiropractic_assessments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chiropractic_assessments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chiropractic_assessment" do
    assert_difference('ChiropracticAssessment.count') do
      post :create, chiropractic_assessment: @chiropractic_assessment.attributes
    end

    assert_redirected_to chiropractic_assessment_path(assigns(:chiropractic_assessment))
  end

  test "should show chiropractic_assessment" do
    get :show, id: @chiropractic_assessment.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @chiropractic_assessment.to_param
    assert_response :success
  end

  test "should update chiropractic_assessment" do
    put :update, id: @chiropractic_assessment.to_param, chiropractic_assessment: @chiropractic_assessment.attributes
    assert_redirected_to chiropractic_assessment_path(assigns(:chiropractic_assessment))
  end

  test "should destroy chiropractic_assessment" do
    assert_difference('ChiropracticAssessment.count', -1) do
      delete :destroy, id: @chiropractic_assessment.to_param
    end

    assert_redirected_to chiropractic_assessments_path
  end
end
