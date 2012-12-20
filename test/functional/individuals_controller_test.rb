require 'test_helper'

class IndividualsControllerTest < ActionController::TestCase
  setup do
    @individual = individuals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:individuals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create individual" do
    assert_difference('Individual.count') do
      post :create, individual: { canvas_id: @individual.canvas_id, email: @individual.email, firstname: @individual.firstname, gradyear: @individual.gradyear, lastname: @individual.lastname, sisid: @individual.sisid, type: @individual.type }
    end

    assert_redirected_to individual_path(assigns(:individual))
  end

  test "should show individual" do
    get :show, id: @individual
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @individual
    assert_response :success
  end

  test "should update individual" do
    put :update, id: @individual, individual: { canvas_id: @individual.canvas_id, email: @individual.email, firstname: @individual.firstname, gradyear: @individual.gradyear, lastname: @individual.lastname, sisid: @individual.sisid, type: @individual.type }
    assert_redirected_to individual_path(assigns(:individual))
  end

  test "should destroy individual" do
    assert_difference('Individual.count', -1) do
      delete :destroy, id: @individual
    end

    assert_redirected_to individuals_path
  end
end
