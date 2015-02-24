require 'test_helper'

class MtEnergyDatasControllerTest < ActionController::TestCase
  setup do
    @mt_energy_data = mt_energy_datas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mt_energy_datas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mt_energy_data" do
    assert_difference('MtEnergyData.count') do
      post :create, :mt_energy_data => @mt_energy_data.attributes
    end

    assert_redirected_to mt_energy_data_path(assigns(:mt_energy_data))
  end

  test "should show mt_energy_data" do
    get :show, :id => @mt_energy_data.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @mt_energy_data.to_param
    assert_response :success
  end

  test "should update mt_energy_data" do
    put :update, :id => @mt_energy_data.to_param, :mt_energy_data => @mt_energy_data.attributes
    assert_redirected_to mt_energy_data_path(assigns(:mt_energy_data))
  end

  test "should destroy mt_energy_data" do
    assert_difference('MtEnergyData.count', -1) do
      delete :destroy, :id => @mt_energy_data.to_param
    end

    assert_redirected_to mt_energy_datas_path
  end
end
