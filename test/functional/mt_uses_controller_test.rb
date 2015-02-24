require 'test_helper'

class MtUsesControllerTest < ActionController::TestCase
  setup do
    @mt_use = mt_uses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mt_uses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mt_use" do
    assert_difference('MtUse.count') do
      post :create, :mt_use => @mt_use.attributes
    end

    assert_redirected_to mt_use_path(assigns(:mt_use))
  end

  test "should show mt_use" do
    get :show, :id => @mt_use.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @mt_use.to_param
    assert_response :success
  end

  test "should update mt_use" do
    put :update, :id => @mt_use.to_param, :mt_use => @mt_use.attributes
    assert_redirected_to mt_use_path(assigns(:mt_use))
  end

  test "should destroy mt_use" do
    assert_difference('MtUse.count', -1) do
      delete :destroy, :id => @mt_use.to_param
    end

    assert_redirected_to mt_uses_path
  end
end
