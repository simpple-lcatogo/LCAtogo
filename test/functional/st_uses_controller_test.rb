require 'test_helper'

class StUsesControllerTest < ActionController::TestCase
  setup do
    @st_use = st_uses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:st_uses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create st_use" do
    assert_difference('StUse.count') do
      post :create, :st_use => @st_use.attributes
    end

    assert_redirected_to st_use_path(assigns(:st_use))
  end

  test "should show st_use" do
    get :show, :id => @st_use.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @st_use.to_param
    assert_response :success
  end

  test "should update st_use" do
    put :update, :id => @st_use.to_param, :st_use => @st_use.attributes
    assert_redirected_to st_use_path(assigns(:st_use))
  end

  test "should destroy st_use" do
    assert_difference('StUse.count', -1) do
      delete :destroy, :id => @st_use.to_param
    end

    assert_redirected_to st_uses_path
  end
end
