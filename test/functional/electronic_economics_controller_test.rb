require 'test_helper'

class ElectronicEconomicsControllerTest < ActionController::TestCase
  setup do
    @electronic_economic = electronic_economics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:electronic_economics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create electronic_economic" do
    assert_difference('ElectronicEconomic.count') do
      post :create, :electronic_economic => @electronic_economic.attributes
    end

    assert_redirected_to electronic_economic_path(assigns(:electronic_economic))
  end

  test "should show electronic_economic" do
    get :show, :id => @electronic_economic.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @electronic_economic.to_param
    assert_response :success
  end

  test "should update electronic_economic" do
    put :update, :id => @electronic_economic.to_param, :electronic_economic => @electronic_economic.attributes
    assert_redirected_to electronic_economic_path(assigns(:electronic_economic))
  end

  test "should destroy electronic_economic" do
    assert_difference('ElectronicEconomic.count', -1) do
      delete :destroy, :id => @electronic_economic.to_param
    end

    assert_redirected_to electronic_economics_path
  end
end
