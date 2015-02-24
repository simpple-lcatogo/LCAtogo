require 'test_helper'

class StEnergyDatasControllerTest < ActionController::TestCase
  setup do
    @st_energy_data = st_energy_datas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:st_energy_datas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create st_energy_data" do
    assert_difference('StEnergyData.count') do
      post :create, :st_energy_data => @st_energy_data.attributes
    end

    assert_redirected_to st_energy_data_path(assigns(:st_energy_data))
  end

  test "should show st_energy_data" do
    get :show, :id => @st_energy_data.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @st_energy_data.to_param
    assert_response :success
  end

  test "should update st_energy_data" do
    put :update, :id => @st_energy_data.to_param, :st_energy_data => @st_energy_data.attributes
    assert_redirected_to st_energy_data_path(assigns(:st_energy_data))
  end

  test "should destroy st_energy_data" do
    assert_difference('StEnergyData.count', -1) do
      delete :destroy, :id => @st_energy_data.to_param
    end

    assert_redirected_to st_energy_datas_path
  end
end
