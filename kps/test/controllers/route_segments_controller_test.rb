require 'test_helper'

class RouteSegmentsControllerTest < ActionController::TestCase
  setup do
    @route_segment = route_segments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:route_segments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create route_segment" do
    assert_difference('RouteSegment.count') do
      post :create, route_segment: { active: @route_segment.active, company_id: @route_segment.company_id, cost: @route_segment.cost, costVolume: @route_segment.costVolume, costWeight: @route_segment.costWeight, duration: @route_segment.duration, from_id: @route_segment.from_id, to_id: @route_segment.to_id }
    end

    assert_redirected_to route_segment_path(assigns(:route_segment))
  end

  test "should show route_segment" do
    get :show, id: @route_segment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @route_segment
    assert_response :success
  end

  test "should update route_segment" do
    patch :update, id: @route_segment, route_segment: { active: @route_segment.active, company_id: @route_segment.company_id, cost: @route_segment.cost, costVolume: @route_segment.costVolume, costWeight: @route_segment.costWeight, duration: @route_segment.duration, from_id: @route_segment.from_id, to_id: @route_segment.to_id }
    assert_redirected_to route_segment_path(assigns(:route_segment))
  end

  test "should destroy route_segment" do
    assert_difference('RouteSegment.count', -1) do
      delete :destroy, id: @route_segment
    end

    assert_redirected_to route_segments_path
  end
end
