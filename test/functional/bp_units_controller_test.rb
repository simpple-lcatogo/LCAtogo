require 'test_helper'

class BpUnitsControllerTest < ActionController::TestCase
  setup do
    @bp_unit = bp_units(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:units)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create unit" do
    assert_difference('Unit.count') do
      post :create, :bp_unit => @bp_unit.attributes
    end

    assert_redirected_to unit_path(assigns(:bp_unit))
  end

  test "should show unit" do
    get :show, :id => @bp_unit.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @bp_unit.to_param
    assert_response :success
  end

  test "should update unit" do
    put :update, :id => @bp_unit.to_param, :bp_unit => @bp_unit.attributes
    assert_redirected_to bp_unit_path(assigns(:bp_unit))
  end

  test "should destroy unit" do
    assert_difference('Unit.count', -1) do
      delete :destroy, :id => @bp_unit.to_param
    end

    assert_redirected_to bp_units_path
  end
end
