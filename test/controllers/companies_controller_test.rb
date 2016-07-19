require 'test_helper'

class CompaniesControllerTest < ActionController::TestCase
  setup do
    @company = companies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:companies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create company" do
    assert_difference('Company.count') do
      post :create, company: { address1: @company.address1, address2: @company.address2, charityNavigator: @company.charityNavigator, city: @company.city, companyName: @company.companyName, country: @company.country, description: @company.description, email: @company.email, facebook: @company.facebook, faxPhone: @company.faxPhone, googlePlus: @company.googlePlus, guideStar: @company.guideStar, instagram: @company.instagram, latitude: @company.latitude, longitude: @company.longitude, nonProfit: @company.nonProfit, officePhone: @company.officePhone, pinterest: @company.pinterest, published: @company.published, state: @company.state, tubler: @company.tubler, twitter: @company.twitter, user_id: @company.user_id, website: @company.website, zipCode: @company.zipCode }
    end

    assert_redirected_to company_path(assigns(:company))
  end

  test "should show company" do
    get :show, id: @company
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @company
    assert_response :success
  end

  test "should update company" do
    patch :update, id: @company, company: { address1: @company.address1, address2: @company.address2, charityNavigator: @company.charityNavigator, city: @company.city, companyName: @company.companyName, country: @company.country, description: @company.description, email: @company.email, facebook: @company.facebook, faxPhone: @company.faxPhone, googlePlus: @company.googlePlus, guideStar: @company.guideStar, instagram: @company.instagram, latitude: @company.latitude, longitude: @company.longitude, nonProfit: @company.nonProfit, officePhone: @company.officePhone, pinterest: @company.pinterest, published: @company.published, state: @company.state, tubler: @company.tubler, twitter: @company.twitter, user_id: @company.user_id, website: @company.website, zipCode: @company.zipCode }
    assert_redirected_to company_path(assigns(:company))
  end

  test "should destroy company" do
    assert_difference('Company.count', -1) do
      delete :destroy, id: @company
    end

    assert_redirected_to companies_path
  end
end
