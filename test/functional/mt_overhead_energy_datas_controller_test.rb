require 'test_helper'

class MtOverheadEnergyDatasControllerTest < ActionController::TestCase
  setup do
    @mt_overhead_energy_data = mt_overhead_energy_datas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mt_overhead_energy_datas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mt_overhead_energy_data" do
    assert_difference('MtOverheadEnergyData.count') do
      post :create, :mt_overhead_energy_data => @mt_overhead_energy_data.attributes
    end

    assert_redirected_to mt_overhead_energy_data_path(assigns(:mt_overhead_energy_data))
  end

  test "should show mt_overhead_energy_data" do
    get :show, :id => @mt_overhead_energy_data.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @mt_overhead_energy_data.to_param
    assert_response :success
  end

  test "should update mt_overhead_energy_data" do
    put :update, :id => @mt_overhead_energy_data.to_param, :mt_overhead_energy_data => @mt_overhead_energy_data.attributes
    assert_redirected_to mt_overhead_energy_data_path(assigns(:mt_overhead_energy_data))
  end

  test "should destroy mt_overhead_energy_data" do
    assert_difference('MtOverheadEnergyData.count', -1) do
      delete :destroy, :id => @mt_overhead_energy_data.to_param
    end

    assert_redirected_to mt_overhead_energy_datas_path
  end
end
