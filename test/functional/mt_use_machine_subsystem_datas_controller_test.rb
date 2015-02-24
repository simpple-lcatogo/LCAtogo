require 'test_helper'

class MtUseMachineSubsystemDatasControllerTest < ActionController::TestCase
  setup do
    @mt_use_machine_subsystem_data = mt_use_machine_subsystem_datas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mt_use_machine_subsystem_datas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mt_use_machine_subsystem_data" do
    assert_difference('MtUseMachineSubsystemData.count') do
      post :create, :mt_use_machine_subsystem_data => @mt_use_machine_subsystem_data.attributes
    end

    assert_redirected_to mt_use_machine_subsystem_data_path(assigns(:mt_use_machine_subsystem_data))
  end

  test "should show mt_use_machine_subsystem_data" do
    get :show, :id => @mt_use_machine_subsystem_data.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @mt_use_machine_subsystem_data.to_param
    assert_response :success
  end

  test "should update mt_use_machine_subsystem_data" do
    put :update, :id => @mt_use_machine_subsystem_data.to_param, :mt_use_machine_subsystem_data => @mt_use_machine_subsystem_data.attributes
    assert_redirected_to mt_use_machine_subsystem_data_path(assigns(:mt_use_machine_subsystem_data))
  end

  test "should destroy mt_use_machine_subsystem_data" do
    assert_difference('MtUseMachineSubsystemData.count', -1) do
      delete :destroy, :id => @mt_use_machine_subsystem_data.to_param
    end

    assert_redirected_to mt_use_machine_subsystem_datas_path
  end
end
