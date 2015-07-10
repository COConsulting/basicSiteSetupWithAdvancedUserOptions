require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get dashboard" do
    get :dashboard
    assert_response :success
  end

  test "should get moderate_users" do
    get :moderate_users
    assert_response :success
  end

  test "should get moderate_events" do
    get :moderate_events
    assert_response :success
  end

  test "should get moderate_event_items" do
    get :moderate_event_items
    assert_response :success
  end

  test "should get moderate_companies" do
    get :moderate_companies
    assert_response :success
  end

  test "should get moderate_locations" do
    get :moderate_locations
    assert_response :success
  end

  test "should get moderate_stories" do
    get :moderate_stories
    assert_response :success
  end

end
