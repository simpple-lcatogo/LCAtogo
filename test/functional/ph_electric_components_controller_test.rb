require 'test_helper'

class PhElectricComponentsControllerTest < ActionController::TestCase
  setup do
    @ph_electric_component = ph_electric_components(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ph_electric_components)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ph_electric_component" do
    assert_difference('PhElectricComponent.count') do
      post :create, :ph_electric_component => @ph_electric_component.attributes
    end

    assert_redirected_to ph_electric_component_path(assigns(:ph_electric_component))
  end

  test "should show ph_electric_component" do
    get :show, :id => @ph_electric_component.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @ph_electric_component.to_param
    assert_response :success
  end

  test "should update ph_electric_component" do
    put :update, :id => @ph_electric_component.to_param, :ph_electric_component => @ph_electric_component.attributes
    assert_redirected_to ph_electric_component_path(assigns(:ph_electric_component))
  end

  test "should destroy ph_electric_component" do
    assert_difference('PhElectricComponent.count', -1) do
      delete :destroy, :id => @ph_electric_component.to_param
    end

    assert_redirected_to ph_electric_components_path
  end
end
