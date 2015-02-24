require 'test_helper'

class StConsumableDatasControllerTest < ActionController::TestCase
  setup do
    @st_consumable_data = st_consumable_datas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:st_consumable_datas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create st_consumable_data" do
    assert_difference('StConsumableData.count') do
      post :create, :st_consumable_data => @st_consumable_data.attributes
    end

    assert_redirected_to st_consumable_data_path(assigns(:st_consumable_data))
  end

  test "should show st_consumable_data" do
    get :show, :id => @st_consumable_data.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @st_consumable_data.to_param
    assert_response :success
  end

  test "should update st_consumable_data" do
    put :update, :id => @st_consumable_data.to_param, :st_consumable_data => @st_consumable_data.attributes
    assert_redirected_to st_consumable_data_path(assigns(:st_consumable_data))
  end

  test "should destroy st_consumable_data" do
    assert_difference('StConsumableData.count', -1) do
      delete :destroy, :id => @st_consumable_data.to_param
    end

    assert_redirected_to st_consumable_datas_path
  end
end
