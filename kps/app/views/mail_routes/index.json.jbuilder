json.array!(@mail_routes) do |mail_route|
  json.extract! mail_route, :id, :to_id, :from_id, :margin, :priority_id
  json.url mail_route_url(mail_route, format: :json)
end
