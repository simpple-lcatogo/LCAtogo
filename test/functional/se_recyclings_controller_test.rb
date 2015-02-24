require 'test_helper'

class SeRecyclingsControllerTest < ActionController::TestCase
  setup do
    @se_recycling = se_recyclings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:se_recyclings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create se_recycling" do
    assert_difference('SeRecycling.count') do
      post :create, :se_recycling => @se_recycling.attributes
    end

    assert_redirected_to se_recycling_path(assigns(:se_recycling))
  end

  test "should show se_recycling" do
    get :show, :id => @se_recycling.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @se_recycling.to_param
    assert_response :success
  end

  test "should update se_recycling" do
    put :update, :id => @se_recycling.to_param, :se_recycling => @se_recycling.attributes
    assert_redirected_to se_recycling_path(assigns(:se_recycling))
  end

  test "should destroy se_recycling" do
    assert_difference('SeRecycling.count', -1) do
      delete :destroy, :id => @se_recycling.to_param
    end

    assert_redirected_to se_recyclings_path
  end
end
