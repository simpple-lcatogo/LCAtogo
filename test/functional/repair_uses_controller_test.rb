require 'test_helper'

class RepairUsesControllerTest < ActionController::TestCase
  setup do
    @repair_use = repair_uses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:repair_uses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create repair_use" do
    assert_difference('RepairUse.count') do
      post :create, :repair_use => @repair_use.attributes
    end

    assert_redirected_to repair_use_path(assigns(:repair_use))
  end

  test "should show repair_use" do
    get :show, :id => @repair_use.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @repair_use.to_param
    assert_response :success
  end

  test "should update repair_use" do
    put :update, :id => @repair_use.to_param, :repair_use => @repair_use.attributes
    assert_redirected_to repair_use_path(assigns(:repair_use))
  end

  test "should destroy repair_use" do
    assert_difference('RepairUse.count', -1) do
      delete :destroy, :id => @repair_use.to_param
    end

    assert_redirected_to repair_uses_path
  end
end
