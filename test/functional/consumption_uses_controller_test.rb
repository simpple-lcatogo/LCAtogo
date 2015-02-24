require 'test_helper'

class ConsumptionUsesControllerTest < ActionController::TestCase
  setup do
    @consumption_use = consumption_uses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:consumption_uses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create consumption_use" do
    assert_difference('ConsumptionUse.count') do
      post :create, :consumption_use => @consumption_use.attributes
    end

    assert_redirected_to consumption_use_path(assigns(:consumption_use))
  end

  test "should show consumption_use" do
    get :show, :id => @consumption_use.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @consumption_use.to_param
    assert_response :success
  end

  test "should update consumption_use" do
    put :update, :id => @consumption_use.to_param, :consumption_use => @consumption_use.attributes
    assert_redirected_to consumption_use_path(assigns(:consumption_use))
  end

  test "should destroy consumption_use" do
    assert_difference('ConsumptionUse.count', -1) do
      delete :destroy, :id => @consumption_use.to_param
    end

    assert_redirected_to consumption_uses_path
  end
end
