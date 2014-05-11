json.array!(@route_segments) do |route_segment|
  json.extract! route_segment, :id, :from_id, :to_id, :active, :cost, :duration, :costVolume, :costWeight, :company_id
  json.url route_segment_url(route_segment, format: :json)
end
