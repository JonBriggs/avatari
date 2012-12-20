require 'test_helper'

class TargetAreasControllerTest < ActionController::TestCase
  setup do
    @target_area = target_areas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:target_areas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create target_area" do
    assert_difference('TargetArea.count') do
      post :create, target_area: { description: @target_area.description, name: @target_area.name }
    end

    assert_redirected_to target_area_path(assigns(:target_area))
  end

  test "should show target_area" do
    get :show, id: @target_area
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @target_area
    assert_response :success
  end

  test "should update target_area" do
    put :update, id: @target_area, target_area: { description: @target_area.description, name: @target_area.name }
    assert_redirected_to target_area_path(assigns(:target_area))
  end

  test "should destroy target_area" do
    assert_difference('TargetArea.count', -1) do
      delete :destroy, id: @target_area
    end

    assert_redirected_to target_areas_path
  end
end
