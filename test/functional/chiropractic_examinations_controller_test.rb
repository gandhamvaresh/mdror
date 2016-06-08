require 'test_helper'

class ChiropracticExaminationsControllerTest < ActionController::TestCase
  setup do
    @chiropractic_examination = chiropractic_examinations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chiropractic_examinations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chiropractic_examination" do
    assert_difference('ChiropracticExamination.count') do
      post :create, chiropractic_examination: @chiropractic_examination.attributes
    end

    assert_redirected_to chiropractic_examination_path(assigns(:chiropractic_examination))
  end

  test "should show chiropractic_examination" do
    get :show, id: @chiropractic_examination.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @chiropractic_examination.to_param
    assert_response :success
  end

  test "should update chiropractic_examination" do
    put :update, id: @chiropractic_examination.to_param, chiropractic_examination: @chiropractic_examination.attributes
    assert_redirected_to chiropractic_examination_path(assigns(:chiropractic_examination))
  end

  test "should destroy chiropractic_examination" do
    assert_difference('ChiropracticExamination.count', -1) do
      delete :destroy, id: @chiropractic_examination.to_param
    end

    assert_redirected_to chiropractic_examinations_path
  end
end
