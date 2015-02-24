require 'test_helper'

class SeUseCostsControllerTest < ActionController::TestCase
  setup do
    @se_use_cost = se_use_costs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:se_use_costs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create se_use_cost" do
    assert_difference('SeUseCost.count') do
      post :create, :se_use_cost => @se_use_cost.attributes
    end

    assert_redirected_to se_use_cost_path(assigns(:se_use_cost))
  end

  test "should show se_use_cost" do
    get :show, :id => @se_use_cost.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @se_use_cost.to_param
    assert_response :success
  end

  test "should update se_use_cost" do
    put :update, :id => @se_use_cost.to_param, :se_use_cost => @se_use_cost.attributes
    assert_redirected_to se_use_cost_path(assigns(:se_use_cost))
  end

  test "should destroy se_use_cost" do
    assert_difference('SeUseCost.count', -1) do
      delete :destroy, :id => @se_use_cost.to_param
    end

    assert_redirected_to se_use_costs_path
  end
end
