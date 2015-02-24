require 'test_helper'

class PhSpecifiedsControllerTest < ActionController::TestCase
  setup do
    @ph_specified = ph_specifieds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ph_specifieds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ph_specified" do
    assert_difference('PhSpecified.count') do
      post :create, :ph_specified => @ph_specified.attributes
    end

    assert_redirected_to ph_specified_path(assigns(:ph_specified))
  end

  test "should show ph_specified" do
    get :show, :id => @ph_specified.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @ph_specified.to_param
    assert_response :success
  end

  test "should update ph_specified" do
    put :update, :id => @ph_specified.to_param, :ph_specified => @ph_specified.attributes
    assert_redirected_to ph_specified_path(assigns(:ph_specified))
  end

  test "should destroy ph_specified" do
    assert_difference('PhSpecified.count', -1) do
      delete :destroy, :id => @ph_specified.to_param
    end

    assert_redirected_to ph_specifieds_path
  end
end
