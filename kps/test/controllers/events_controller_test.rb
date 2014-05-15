require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  setup do
    @event = events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event" do
    assert_difference('Event.count') do
      post :create, event: { depart_day: @event.depart_day, depart_frequency: @event.depart_frequency, destination_id: @event.destination_id, duration: @event.duration, origin_id: @event.origin_id, price_per_cubic_cm: @event.price_per_cubic_cm, price_per_gram: @event.price_per_gram, priority_id: @event.priority_id, transport_company_id: @event.transport_company_id, transport_type_id: @event.transport_type_id, type: @event.type, volume: @event.volume, weight: @event.weight }
    end

    assert_redirected_to event_path(assigns(:event))
  end

  test "should show event" do
    get :show, id: @event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event
    assert_response :success
  end

  test "should update event" do
    patch :update, id: @event, event: { depart_day: @event.depart_day, depart_frequency: @event.depart_frequency, destination_id: @event.destination_id, duration: @event.duration, origin_id: @event.origin_id, price_per_cubic_cm: @event.price_per_cubic_cm, price_per_gram: @event.price_per_gram, priority_id: @event.priority_id, transport_company_id: @event.transport_company_id, transport_type_id: @event.transport_type_id, type: @event.type, volume: @event.volume, weight: @event.weight }
    assert_redirected_to event_path(assigns(:event))
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete :destroy, id: @event
    end

    assert_redirected_to events_path
  end
end
