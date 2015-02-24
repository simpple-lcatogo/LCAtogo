require 'test_helper'

class PhBasicInformationsControllerTest < ActionController::TestCase
  setup do
    @ph_basic_information = ph_basic_informations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ph_basic_informations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ph_basic_information" do
    assert_difference('PhBasicInformation.count') do
      post :create, :ph_basic_information => @ph_basic_information.attributes
    end

    assert_redirected_to ph_basic_information_path(assigns(:ph_basic_information))
  end

  test "should show ph_basic_information" do
    get :show, :id => @ph_basic_information.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @ph_basic_information.to_param
    assert_response :success
  end

  test "should update ph_basic_information" do
    put :update, :id => @ph_basic_information.to_param, :ph_basic_information => @ph_basic_information.attributes
    assert_redirected_to ph_basic_information_path(assigns(:ph_basic_information))
  end

  test "should destroy ph_basic_information" do
    assert_difference('PhBasicInformation.count', -1) do
      delete :destroy, :id => @ph_basic_information.to_param
    end

    assert_redirected_to ph_basic_informations_path
  end
end
