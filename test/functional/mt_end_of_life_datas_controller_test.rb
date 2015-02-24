require 'test_helper'

class MtEndOfLifeDatasControllerTest < ActionController::TestCase
  setup do
    @mt_end_of_life_data = mt_end_of_life_datas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mt_end_of_life_datas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mt_end_of_life_data" do
    assert_difference('MtEndOfLifeData.count') do
      post :create, :mt_end_of_life_data => @mt_end_of_life_data.attributes
    end

    assert_redirected_to mt_end_of_life_data_path(assigns(:mt_end_of_life_data))
  end

  test "should show mt_end_of_life_data" do
    get :show, :id => @mt_end_of_life_data.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @mt_end_of_life_data.to_param
    assert_response :success
  end

  test "should update mt_end_of_life_data" do
    put :update, :id => @mt_end_of_life_data.to_param, :mt_end_of_life_data => @mt_end_of_life_data.attributes
    assert_redirected_to mt_end_of_life_data_path(assigns(:mt_end_of_life_data))
  end

  test "should destroy mt_end_of_life_data" do
    assert_difference('MtEndOfLifeData.count', -1) do
      delete :destroy, :id => @mt_end_of_life_data.to_param
    end

    assert_redirected_to mt_end_of_life_datas_path
  end
end
