require 'test_helper'

class LiquidationsControllerTest < ActionController::TestCase
  setup do
    @liquidation = liquidations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:liquidations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create liquidation" do
    assert_difference('Liquidation.count') do
      post :create, liquidation: { liquidated_by_name: @liquidation.liquidated_by_name }
    end

    assert_redirected_to liquidation_path(assigns(:liquidation))
  end

  test "should show liquidation" do
    get :show, id: @liquidation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @liquidation
    assert_response :success
  end

  test "should update liquidation" do
    patch :update, id: @liquidation, liquidation: { liquidated_by_name: @liquidation.liquidated_by_name }
    assert_redirected_to liquidation_path(assigns(:liquidation))
  end

  test "should destroy liquidation" do
    assert_difference('Liquidation.count', -1) do
      delete :destroy, id: @liquidation
    end

    assert_redirected_to liquidations_path
  end
end
