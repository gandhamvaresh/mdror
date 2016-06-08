require 'test_helper'

class ChiropracticObservationListsControllerTest < ActionController::TestCase
  setup do
    @chiropractic_observation_list = chiropractic_observation_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chiropractic_observation_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chiropractic_observation_list" do
    assert_difference('ChiropracticObservationList.count') do
      post :create, chiropractic_observation_list: @chiropractic_observation_list.attributes
    end

    assert_redirected_to chiropractic_observation_list_path(assigns(:chiropractic_observation_list))
  end

  test "should show chiropractic_observation_list" do
    get :show, id: @chiropractic_observation_list.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @chiropractic_observation_list.to_param
    assert_response :success
  end

  test "should update chiropractic_observation_list" do
    put :update, id: @chiropractic_observation_list.to_param, chiropractic_observation_list: @chiropractic_observation_list.attributes
    assert_redirected_to chiropractic_observation_list_path(assigns(:chiropractic_observation_list))
  end

  test "should destroy chiropractic_observation_list" do
    assert_difference('ChiropracticObservationList.count', -1) do
      delete :destroy, id: @chiropractic_observation_list.to_param
    end

    assert_redirected_to chiropractic_observation_lists_path
  end
end
