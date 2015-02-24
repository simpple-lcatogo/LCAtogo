require 'test_helper'

class SeManufacturingDatasControllerTest < ActionController::TestCase
  setup do
    @se_manufacturing_data = se_manufacturing_datas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:se_manufacturing_datas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create se_manufacturing_data" do
    assert_difference('SeManufacturingData.count') do
      post :create, :se_manufacturing_data => @se_manufacturing_data.attributes
    end

    assert_redirected_to se_manufacturing_data_path(assigns(:se_manufacturing_data))
  end

  test "should show se_manufacturing_data" do
    get :show, :id => @se_manufacturing_data.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @se_manufacturing_data.to_param
    assert_response :success
  end

  test "should update se_manufacturing_data" do
    put :update, :id => @se_manufacturing_data.to_param, :se_manufacturing_data => @se_manufacturing_data.attributes
    assert_redirected_to se_manufacturing_data_path(assigns(:se_manufacturing_data))
  end

  test "should destroy se_manufacturing_data" do
    assert_difference('SeManufacturingData.count', -1) do
      delete :destroy, :id => @se_manufacturing_data.to_param
    end

    assert_redirected_to se_manufacturing_datas_path
  end
end
