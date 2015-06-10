require 'test_helper'

class TipstersControllerTest < ActionController::TestCase
  setup do
    @tipster = tipsters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipsters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipster" do
    assert_difference('Tipster.count') do
      post :create, tipster: { avg_odds: @tipster.avg_odds, ba_url: @tipster.ba_url, name: @tipster.name, yield: @tipster.yield }
    end

    assert_redirected_to tipster_path(assigns(:tipster))
  end

  test "should show tipster" do
    get :show, id: @tipster
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipster
    assert_response :success
  end

  test "should update tipster" do
    patch :update, id: @tipster, tipster: { avg_odds: @tipster.avg_odds, ba_url: @tipster.ba_url, name: @tipster.name, yield: @tipster.yield }
    assert_redirected_to tipster_path(assigns(:tipster))
  end

  test "should destroy tipster" do
    assert_difference('Tipster.count', -1) do
      delete :destroy, id: @tipster
    end

    assert_redirected_to tipsters_path
  end
end
