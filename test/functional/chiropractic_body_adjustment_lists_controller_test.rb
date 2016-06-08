require 'test_helper'

class ChiropracticBodyAdjustmentListsControllerTest < ActionController::TestCase
  setup do
    @chiropractic_body_adjustment_list = chiropractic_body_adjustment_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chiropractic_body_adjustment_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chiropractic_body_adjustment_list" do
    assert_difference('ChiropracticBodyAdjustmentList.count') do
      post :create, chiropractic_body_adjustment_list: @chiropractic_body_adjustment_list.attributes
    end

    assert_redirected_to chiropractic_body_adjustment_list_path(assigns(:chiropractic_body_adjustment_list))
  end

  test "should show chiropractic_body_adjustment_list" do
    get :show, id: @chiropractic_body_adjustment_list.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @chiropractic_body_adjustment_list.to_param
    assert_response :success
  end

  test "should update chiropractic_body_adjustment_list" do
    put :update, id: @chiropractic_body_adjustment_list.to_param, chiropractic_body_adjustment_list: @chiropractic_body_adjustment_list.attributes
    assert_redirected_to chiropractic_body_adjustment_list_path(assigns(:chiropractic_body_adjustment_list))
  end

  test "should destroy chiropractic_body_adjustment_list" do
    assert_difference('ChiropracticBodyAdjustmentList.count', -1) do
      delete :destroy, id: @chiropractic_body_adjustment_list.to_param
    end

    assert_redirected_to chiropractic_body_adjustment_lists_path
  end
end
