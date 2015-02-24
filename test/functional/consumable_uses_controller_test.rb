require 'test_helper'

class ConsumableUsesControllerTest < ActionController::TestCase
  setup do
    @consumable_use = consumable_uses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:consumable_uses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create consumable_use" do
    assert_difference('ConsumableUse.count') do
      post :create, :consumable_use => @consumable_use.attributes
    end

    assert_redirected_to consumable_use_path(assigns(:consumable_use))
  end

  test "should show consumable_use" do
    get :show, :id => @consumable_use.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @consumable_use.to_param
    assert_response :success
  end

  test "should update consumable_use" do
    put :update, :id => @consumable_use.to_param, :consumable_use => @consumable_use.attributes
    assert_redirected_to consumable_use_path(assigns(:consumable_use))
  end

  test "should destroy consumable_use" do
    assert_difference('ConsumableUse.count', -1) do
      delete :destroy, :id => @consumable_use.to_param
    end

    assert_redirected_to consumable_uses_path
  end
end
