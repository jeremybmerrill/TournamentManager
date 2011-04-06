require 'test_helper'

class TournamentsControllerTest < ActionController::TestCase
  setup do
    @tournament = tournaments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tournaments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tournament" do
    assert_difference('Tournament.count') do
      post :create, :tournament => @tournament.attributes
    end

    assert_redirected_to tournament_path(assigns(:tournament))
  end

  test "should show tournament" do
    get :show, :id => @tournament.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @tournament.to_param
    assert_response :success
  end

  test "should update tournament" do
    put :update, :id => @tournament.to_param, :tournament => @tournament.attributes
    assert_redirected_to tournament_path(assigns(:tournament))
  end

  test "should destroy tournament" do
    assert_difference('Tournament.count', -1) do
      delete :destroy, :id => @tournament.to_param
    end

    assert_redirected_to tournaments_path
  end
end
