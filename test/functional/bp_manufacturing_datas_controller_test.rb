require 'test_helper'

class BpManufacturingDatasControllerTest < ActionController::TestCase
  setup do
    @bp_manufacturing_data = bp_manufacturing_datas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bp_manufacturing_datas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bp_manufacturing_data" do
    assert_difference('BpManufacturingData.count') do
      post :create, :bp_manufacturing_data => @bp_manufacturing_data.attributes
    end

    assert_redirected_to bp_manufacturing_data_path(assigns(:bp_manufacturing_data))
  end

  test "should show bp_manufacturing_data" do
    get :show, :id => @bp_manufacturing_data.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @bp_manufacturing_data.to_param
    assert_response :success
  end

  test "should update bp_manufacturing_data" do
    put :update, :id => @bp_manufacturing_data.to_param, :bp_manufacturing_data => @bp_manufacturing_data.attributes
    assert_redirected_to bp_manufacturing_data_path(assigns(:bp_manufacturing_data))
  end

  test "should destroy bp_manufacturing_data" do
    assert_difference('BpManufacturingData.count', -1) do
      delete :destroy, :id => @bp_manufacturing_data.to_param
    end

    assert_redirected_to bp_manufacturing_datas_path
  end
end
