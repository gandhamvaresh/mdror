require 'test_helper'

class ChiropracticModalitiesListsControllerTest < ActionController::TestCase
  setup do
    @chiropractic_modalities_list = chiropractic_modalities_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chiropractic_modalities_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chiropractic_modalities_list" do
    assert_difference('ChiropracticModalitiesList.count') do
      post :create, chiropractic_modalities_list: @chiropractic_modalities_list.attributes
    end

    assert_redirected_to chiropractic_modalities_list_path(assigns(:chiropractic_modalities_list))
  end

  test "should show chiropractic_modalities_list" do
    get :show, id: @chiropractic_modalities_list.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @chiropractic_modalities_list.to_param
    assert_response :success
  end

  test "should update chiropractic_modalities_list" do
    put :update, id: @chiropractic_modalities_list.to_param, chiropractic_modalities_list: @chiropractic_modalities_list.attributes
    assert_redirected_to chiropractic_modalities_list_path(assigns(:chiropractic_modalities_list))
  end

  test "should destroy chiropractic_modalities_list" do
    assert_difference('ChiropracticModalitiesList.count', -1) do
      delete :destroy, id: @chiropractic_modalities_list.to_param
    end

    assert_redirected_to chiropractic_modalities_lists_path
  end
end
