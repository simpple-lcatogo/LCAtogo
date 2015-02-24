require 'test_helper'

class MtManufacturingsControllerTest < ActionController::TestCase
  setup do
    @mt_manufacturing = mt_manufacturings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mt_manufacturings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mt_manufacturing" do
    assert_difference('MtManufacturing.count') do
      post :create, :mt_manufacturing => @mt_manufacturing.attributes
    end

    assert_redirected_to mt_manufacturing_path(assigns(:mt_manufacturing))
  end

  test "should show mt_manufacturing" do
    get :show, :id => @mt_manufacturing.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @mt_manufacturing.to_param
    assert_response :success
  end

  test "should update mt_manufacturing" do
    put :update, :id => @mt_manufacturing.to_param, :mt_manufacturing => @mt_manufacturing.attributes
    assert_redirected_to mt_manufacturing_path(assigns(:mt_manufacturing))
  end

  test "should destroy mt_manufacturing" do
    assert_difference('MtManufacturing.count', -1) do
      delete :destroy, :id => @mt_manufacturing.to_param
    end

    assert_redirected_to mt_manufacturings_path
  end
end
