require 'test_helper'

class ChiropracticInvestigationListsControllerTest < ActionController::TestCase
  setup do
    @chiropractic_investigation_list = chiropractic_investigation_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chiropractic_investigation_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chiropractic_investigation_list" do
    assert_difference('ChiropracticInvestigationList.count') do
      post :create, chiropractic_investigation_list: @chiropractic_investigation_list.attributes
    end

    assert_redirected_to chiropractic_investigation_list_path(assigns(:chiropractic_investigation_list))
  end

  test "should show chiropractic_investigation_list" do
    get :show, id: @chiropractic_investigation_list.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @chiropractic_investigation_list.to_param
    assert_response :success
  end

  test "should update chiropractic_investigation_list" do
    put :update, id: @chiropractic_investigation_list.to_param, chiropractic_investigation_list: @chiropractic_investigation_list.attributes
    assert_redirected_to chiropractic_investigation_list_path(assigns(:chiropractic_investigation_list))
  end

  test "should destroy chiropractic_investigation_list" do
    assert_difference('ChiropracticInvestigationList.count', -1) do
      delete :destroy, id: @chiropractic_investigation_list.to_param
    end

    assert_redirected_to chiropractic_investigation_lists_path
  end
end
