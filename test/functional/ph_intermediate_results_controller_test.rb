require 'test_helper'

class PhIntermediateResultsControllerTest < ActionController::TestCase
  setup do
    @ph_intermediate_result = ph_intermediate_results(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ph_intermediate_results)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ph_intermediate_result" do
    assert_difference('PhIntermediateResult.count') do
      post :create, :ph_intermediate_result => @ph_intermediate_result.attributes
    end

    assert_redirected_to ph_intermediate_result_path(assigns(:ph_intermediate_result))
  end

  test "should show ph_intermediate_result" do
    get :show, :id => @ph_intermediate_result.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @ph_intermediate_result.to_param
    assert_response :success
  end

  test "should update ph_intermediate_result" do
    put :update, :id => @ph_intermediate_result.to_param, :ph_intermediate_result => @ph_intermediate_result.attributes
    assert_redirected_to ph_intermediate_result_path(assigns(:ph_intermediate_result))
  end

  test "should destroy ph_intermediate_result" do
    assert_difference('PhIntermediateResult.count', -1) do
      delete :destroy, :id => @ph_intermediate_result.to_param
    end

    assert_redirected_to ph_intermediate_results_path
  end
end
