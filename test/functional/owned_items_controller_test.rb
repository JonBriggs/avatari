require 'test_helper'

class OwnedItemsControllerTest < ActionController::TestCase
  setup do
    @owned_item = owned_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:owned_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create owned_item" do
    assert_difference('OwnedItem.count') do
      post :create, owned_item: { individual_id: @owned_item.individual_id, item_id: @owned_item.item_id, stats: @owned_item.stats }
    end

    assert_redirected_to owned_item_path(assigns(:owned_item))
  end

  test "should show owned_item" do
    get :show, id: @owned_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @owned_item
    assert_response :success
  end

  test "should update owned_item" do
    put :update, id: @owned_item, owned_item: { individual_id: @owned_item.individual_id, item_id: @owned_item.item_id, stats: @owned_item.stats }
    assert_redirected_to owned_item_path(assigns(:owned_item))
  end

  test "should destroy owned_item" do
    assert_difference('OwnedItem.count', -1) do
      delete :destroy, id: @owned_item
    end

    assert_redirected_to owned_items_path
  end
end
