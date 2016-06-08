require 'test_helper'

class ChiropracticDiagnosisListsControllerTest < ActionController::TestCase
  setup do
    @chiropractic_diagnosis_list = chiropractic_diagnosis_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chiropractic_diagnosis_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chiropractic_diagnosis_list" do
    assert_difference('ChiropracticDiagnosisList.count') do
      post :create, chiropractic_diagnosis_list: @chiropractic_diagnosis_list.attributes
    end

    assert_redirected_to chiropractic_diagnosis_list_path(assigns(:chiropractic_diagnosis_list))
  end

  test "should show chiropractic_diagnosis_list" do
    get :show, id: @chiropractic_diagnosis_list.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @chiropractic_diagnosis_list.to_param
    assert_response :success
  end

  test "should update chiropractic_diagnosis_list" do
    put :update, id: @chiropractic_diagnosis_list.to_param, chiropractic_diagnosis_list: @chiropractic_diagnosis_list.attributes
    assert_redirected_to chiropractic_diagnosis_list_path(assigns(:chiropractic_diagnosis_list))
  end

  test "should destroy chiropractic_diagnosis_list" do
    assert_difference('ChiropracticDiagnosisList.count', -1) do
      delete :destroy, id: @chiropractic_diagnosis_list.to_param
    end

    assert_redirected_to chiropractic_diagnosis_lists_path
  end
end
