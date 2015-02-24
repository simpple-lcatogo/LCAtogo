require 'test_helper'

class PcBasicsControllerTest < ActionController::TestCase
  setup do
    @pc_basic = pc_basics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pc_basics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pc_basic" do
    assert_difference('PcBasic.count') do
      post :create, :pc_basic => @pc_basic.attributes
    end

    assert_redirected_to pc_basic_path(assigns(:pc_basic))
  end

  test "should show pc_basic" do
    get :show, :id => @pc_basic.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @pc_basic.to_param
    assert_response :success
  end

  test "should update pc_basic" do
    put :update, :id => @pc_basic.to_param, :pc_basic => @pc_basic.attributes
    assert_redirected_to pc_basic_path(assigns(:pc_basic))
  end

  test "should destroy pc_basic" do
    assert_difference('PcBasic.count', -1) do
      delete :destroy, :id => @pc_basic.to_param
    end

    assert_redirected_to pc_basics_path
  end
end
