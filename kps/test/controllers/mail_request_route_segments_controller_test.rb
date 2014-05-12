require 'test_helper'

class MailRequestRouteSegmentsControllerTest < ActionController::TestCase
  setup do
    @mail_request_route_segment = mail_request_route_segments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mail_request_route_segments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mail_request_route_segment" do
    assert_difference('MailRequestRouteSegment.count') do
      post :create, mail_request_route_segment: { mail_request_id: @mail_request_route_segment.mail_request_id, route_segment_id: @mail_request_route_segment.route_segment_id }
    end

    assert_redirected_to mail_request_route_segment_path(assigns(:mail_request_route_segment))
  end

  test "should show mail_request_route_segment" do
    get :show, id: @mail_request_route_segment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mail_request_route_segment
    assert_response :success
  end

  test "should update mail_request_route_segment" do
    patch :update, id: @mail_request_route_segment, mail_request_route_segment: { mail_request_id: @mail_request_route_segment.mail_request_id, route_segment_id: @mail_request_route_segment.route_segment_id }
    assert_redirected_to mail_request_route_segment_path(assigns(:mail_request_route_segment))
  end

  test "should destroy mail_request_route_segment" do
    assert_difference('MailRequestRouteSegment.count', -1) do
      delete :destroy, id: @mail_request_route_segment
    end

    assert_redirected_to mail_request_route_segments_path
  end
end
