require 'test_helper'

class ManufacturingDatasControllerTest < ActionController::TestCase
  setup do
    @manufacturing_data = manufacturing_datas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:manufacturing_datas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create manufacturing_data" do
    assert_difference('ManufacturingData.count') do
      post :create, :manufacturing_data => @manufacturing_data.attributes
    end

    assert_redirected_to manufacturing_data_path(assigns(:manufacturing_data))
  end

  test "should show manufacturing_data" do
    get :show, :id => @manufacturing_data.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @manufacturing_data.to_param
    assert_response :success
  end

  test "should update manufacturing_data" do
    put :update, :id => @manufacturing_data.to_param, :manufacturing_data => @manufacturing_data.attributes
    assert_redirected_to manufacturing_data_path(assigns(:manufacturing_data))
  end

  test "should destroy manufacturing_data" do
    assert_difference('ManufacturingData.count', -1) do
      delete :destroy, :id => @manufacturing_data.to_param
    end

    assert_redirected_to manufacturing_datas_path
  end
end
