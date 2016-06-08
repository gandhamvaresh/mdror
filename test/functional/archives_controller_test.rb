require 'test_helper'

class ArchivesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get users" do
    get :users
    assert_response :success
  end

  test "should get clients" do
    get :clients
    assert_response :success
  end

  test "should get patients" do
    get :patients
    assert_response :success
  end

  test "should get accidents" do
    get :accidents
    assert_response :success
  end

  test "should get chiropractic_examinations" do
    get :chiropractic_examinations
    assert_response :success
  end

  test "should get chiropractic_treatments" do
    get :chiropractic_treatments
    assert_response :success
  end

end
