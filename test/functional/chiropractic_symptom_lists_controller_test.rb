require 'test_helper'

class ChiropracticSymptomListsControllerTest < ActionController::TestCase
  setup do
    @chiropractic_symptom_list = chiropractic_symptom_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chiropractic_symptom_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chiropractic_symptom_list" do
    assert_difference('ChiropracticSymptomList.count') do
      post :create, chiropractic_symptom_list: @chiropractic_symptom_list.attributes
    end

    assert_redirected_to chiropractic_symptom_list_path(assigns(:chiropractic_symptom_list))
  end

  test "should show chiropractic_symptom_list" do
    get :show, id: @chiropractic_symptom_list.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @chiropractic_symptom_list.to_param
    assert_response :success
  end

  test "should update chiropractic_symptom_list" do
    put :update, id: @chiropractic_symptom_list.to_param, chiropractic_symptom_list: @chiropractic_symptom_list.attributes
    assert_redirected_to chiropractic_symptom_list_path(assigns(:chiropractic_symptom_list))
  end

  test "should destroy chiropractic_symptom_list" do
    assert_difference('ChiropracticSymptomList.count', -1) do
      delete :destroy, id: @chiropractic_symptom_list.to_param
    end

    assert_redirected_to chiropractic_symptom_lists_path
  end
end
