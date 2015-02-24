require 'test_helper'

class SeUseProductionsControllerTest < ActionController::TestCase
  setup do
    @se_use_production = se_use_productions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:se_use_productions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create se_use_production" do
    assert_difference('SeUseProduction.count') do
      post :create, :se_use_production => @se_use_production.attributes
    end

    assert_redirected_to se_use_production_path(assigns(:se_use_production))
  end

  test "should show se_use_production" do
    get :show, :id => @se_use_production.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @se_use_production.to_param
    assert_response :success
  end

  test "should update se_use_production" do
    put :update, :id => @se_use_production.to_param, :se_use_production => @se_use_production.attributes
    assert_redirected_to se_use_production_path(assigns(:se_use_production))
  end

  test "should destroy se_use_production" do
    assert_difference('SeUseProduction.count', -1) do
      delete :destroy, :id => @se_use_production.to_param
    end

    assert_redirected_to se_use_productions_path
  end
end
