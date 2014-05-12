require 'test_helper'

class MailRequestsControllerTest < ActionController::TestCase
  setup do
    @mail_request = mail_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mail_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mail_request" do
    assert_difference('MailRequest.count') do
      post :create, mail_request: { mail_route_id: @mail_request.mail_route_id, price: @mail_request.price, priority_id: @mail_request.priority_id, volume: @mail_request.volume, weight: @mail_request.weight }
    end

    assert_redirected_to mail_request_path(assigns(:mail_request))
  end

  test "should show mail_request" do
    get :show, id: @mail_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mail_request
    assert_response :success
  end

  test "should update mail_request" do
    patch :update, id: @mail_request, mail_request: { mail_route_id: @mail_request.mail_route_id, price: @mail_request.price, priority_id: @mail_request.priority_id, volume: @mail_request.volume, weight: @mail_request.weight }
    assert_redirected_to mail_request_path(assigns(:mail_request))
  end

  test "should destroy mail_request" do
    assert_difference('MailRequest.count', -1) do
      delete :destroy, id: @mail_request
    end

    assert_redirected_to mail_requests_path
  end
end
