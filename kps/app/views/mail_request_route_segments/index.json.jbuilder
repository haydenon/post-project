json.array!(@mail_request_route_segments) do |mail_request_route_segment|
  json.extract! mail_request_route_segment, :id, :route_segment_id, :mail_request_id
  json.url mail_request_route_segment_url(mail_request_route_segment, format: :json)
end
