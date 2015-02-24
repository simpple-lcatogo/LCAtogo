require 'test_helper'

class EconomicsControllerTest < ActionController::TestCase
  setup do
    @economic = economics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:economics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create economic" do
    assert_difference('Economic.count') do
      post :create, :economic => @economic.attributes
    end

    assert_redirected_to economic_path(assigns(:economic))
  end

  test "should show economic" do
    get :show, :id => @economic.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @economic.to_param
    assert_response :success
  end

  test "should update economic" do
    put :update, :id => @economic.to_param, :economic => @economic.attributes
    assert_redirected_to economic_path(assigns(:economic))
  end

  test "should destroy economic" do
    assert_difference('Economic.count', -1) do
      delete :destroy, :id => @economic.to_param
    end

    assert_redirected_to economics_path
  end
end
