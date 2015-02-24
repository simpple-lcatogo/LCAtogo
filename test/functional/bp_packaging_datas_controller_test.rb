require 'test_helper'

class BpPackagingDatasControllerTest < ActionController::TestCase
  setup do
    @bp_packaging_data = bp_packaging_datas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bp_packaging_datas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bp_packaging_data" do
    assert_difference('BpPackagingData.count') do
      post :create, :bp_packaging_data => @bp_packaging_data.attributes
    end

    assert_redirected_to bp_packaging_data_path(assigns(:bp_packaging_data))
  end

  test "should show bp_packaging_data" do
    get :show, :id => @bp_packaging_data.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @bp_packaging_data.to_param
    assert_response :success
  end

  test "should update bp_packaging_data" do
    put :update, :id => @bp_packaging_data.to_param, :bp_packaging_data => @bp_packaging_data.attributes
    assert_redirected_to bp_packaging_data_path(assigns(:bp_packaging_data))
  end

  test "should destroy bp_packaging_data" do
    assert_difference('BpPackagingData.count', -1) do
      delete :destroy, :id => @bp_packaging_data.to_param
    end

    assert_redirected_to bp_packaging_datas_path
  end
end
