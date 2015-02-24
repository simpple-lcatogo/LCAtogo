require 'test_helper'

class PhMaintenancesControllerTest < ActionController::TestCase
  setup do
    @ph_maintenance = ph_maintenances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ph_maintenances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ph_maintenance" do
    assert_difference('PhMaintenance.count') do
      post :create, :ph_maintenance => @ph_maintenance.attributes
    end

    assert_redirected_to ph_maintenance_path(assigns(:ph_maintenance))
  end

  test "should show ph_maintenance" do
    get :show, :id => @ph_maintenance.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @ph_maintenance.to_param
    assert_response :success
  end

  test "should update ph_maintenance" do
    put :update, :id => @ph_maintenance.to_param, :ph_maintenance => @ph_maintenance.attributes
    assert_redirected_to ph_maintenance_path(assigns(:ph_maintenance))
  end

  test "should destroy ph_maintenance" do
    assert_difference('PhMaintenance.count', -1) do
      delete :destroy, :id => @ph_maintenance.to_param
    end

    assert_redirected_to ph_maintenances_path
  end
end
