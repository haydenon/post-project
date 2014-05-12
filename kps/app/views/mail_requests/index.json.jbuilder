json.array!(@mail_requests) do |mail_request|
  json.extract! mail_request, :id, :mail_route_id, :price, :weight, :volume, :priority_id
  json.url mail_request_url(mail_request, format: :json)
end
