require 'test_helper'

class LiquidationCategoriesControllerTest < ActionController::TestCase
  setup do
    @liquidation_category = liquidation_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:liquidation_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create liquidation_category" do
    assert_difference('LiquidationCategory.count') do
      post :create, liquidation_category: { default_flag: @liquidation_category.default_flag, name: @liquidation_category.name }
    end

    assert_redirected_to liquidation_category_path(assigns(:liquidation_category))
  end

  test "should show liquidation_category" do
    get :show, id: @liquidation_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @liquidation_category
    assert_response :success
  end

  test "should update liquidation_category" do
    patch :update, id: @liquidation_category, liquidation_category: { default_flag: @liquidation_category.default_flag, name: @liquidation_category.name }
    assert_redirected_to liquidation_category_path(assigns(:liquidation_category))
  end

  test "should destroy liquidation_category" do
    assert_difference('LiquidationCategory.count', -1) do
      delete :destroy, id: @liquidation_category
    end

    assert_redirected_to liquidation_categories_path
  end
end
