require 'test_helper'

class LiquidationFormLinesControllerTest < ActionController::TestCase
  setup do
    @liquidation_form_line = liquidation_form_lines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:liquidation_form_lines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create liquidation_form_line" do
    assert_difference('LiquidationFormLine.count') do
      post :create, liquidation_form_line: { name: @liquidation_form_line.name }
    end

    assert_redirected_to liquidation_form_line_path(assigns(:liquidation_form_line))
  end

  test "should show liquidation_form_line" do
    get :show, id: @liquidation_form_line
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @liquidation_form_line
    assert_response :success
  end

  test "should update liquidation_form_line" do
    patch :update, id: @liquidation_form_line, liquidation_form_line: { name: @liquidation_form_line.name }
    assert_redirected_to liquidation_form_line_path(assigns(:liquidation_form_line))
  end

  test "should destroy liquidation_form_line" do
    assert_difference('LiquidationFormLine.count', -1) do
      delete :destroy, id: @liquidation_form_line
    end

    assert_redirected_to liquidation_form_lines_path
  end
end
