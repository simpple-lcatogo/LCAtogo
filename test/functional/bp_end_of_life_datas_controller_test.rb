require 'test_helper'

class BpEndOfLifeDatasControllerTest < ActionController::TestCase
  setup do
    @bp_end_of_life_data = bp_end_of_life_datas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bp_end_of_life_datas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bp_end_of_life_data" do
    assert_difference('BpEndOfLifeData.count') do
      post :create, :bp_end_of_life_data => @bp_end_of_life_data.attributes
    end

    assert_redirected_to bp_end_of_life_data_path(assigns(:bp_end_of_life_data))
  end

  test "should show bp_end_of_life_data" do
    get :show, :id => @bp_end_of_life_data.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @bp_end_of_life_data.to_param
    assert_response :success
  end

  test "should update bp_end_of_life_data" do
    put :update, :id => @bp_end_of_life_data.to_param, :bp_end_of_life_data => @bp_end_of_life_data.attributes
    assert_redirected_to bp_end_of_life_data_path(assigns(:bp_end_of_life_data))
  end

  test "should destroy bp_end_of_life_data" do
    assert_difference('BpEndOfLifeData.count', -1) do
      delete :destroy, :id => @bp_end_of_life_data.to_param
    end

    assert_redirected_to bp_end_of_life_datas_path
  end
end
