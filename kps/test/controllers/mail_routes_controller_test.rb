require 'test_helper'

class MailRoutesControllerTest < ActionController::TestCase
  setup do
    @mail_route = mail_routes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mail_routes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mail_route" do
    assert_difference('MailRoute.count') do
      post :create, mail_route: { from_id: @mail_route.from_id, margin: @mail_route.margin, priority_id: @mail_route.priority_id, to_id: @mail_route.to_id }
    end

    assert_redirected_to mail_route_path(assigns(:mail_route))
  end

  test "should show mail_route" do
    get :show, id: @mail_route
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mail_route
    assert_response :success
  end

  test "should update mail_route" do
    patch :update, id: @mail_route, mail_route: { from_id: @mail_route.from_id, margin: @mail_route.margin, priority_id: @mail_route.priority_id, to_id: @mail_route.to_id }
    assert_redirected_to mail_route_path(assigns(:mail_route))
  end

  test "should destroy mail_route" do
    assert_difference('MailRoute.count', -1) do
      delete :destroy, id: @mail_route
    end

    assert_redirected_to mail_routes_path
  end
end
