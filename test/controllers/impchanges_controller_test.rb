require 'test_helper'

class ImpchangesControllerTest < ActionController::TestCase
  setup do
    @impchange = impchanges(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:impchanges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create impchange" do
    assert_difference('Impchange.count') do
      post :create, impchange: { change_about: @impchange.change_about, change_date: @impchange.change_date, change_last_term: @impchange.change_last_term, change_status: @impchange.change_status, implementation_id: @impchange.implementation_id, user_id: @impchange.user_id }
    end

    assert_redirected_to impchange_path(assigns(:impchange))
  end

  test "should show impchange" do
    get :show, id: @impchange
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @impchange
    assert_response :success
  end

  test "should update impchange" do
    patch :update, id: @impchange, impchange: { change_about: @impchange.change_about, change_date: @impchange.change_date, change_last_term: @impchange.change_last_term, change_status: @impchange.change_status, implementation_id: @impchange.implementation_id, user_id: @impchange.user_id }
    assert_redirected_to impchange_path(assigns(:impchange))
  end

  test "should destroy impchange" do
    assert_difference('Impchange.count', -1) do
      delete :destroy, id: @impchange
    end

    assert_redirected_to impchanges_path
  end
end
