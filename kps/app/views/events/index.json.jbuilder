json.array!(@events) do |event|
  json.extract! event, :id, :type, :origin_id, :destination_id, :weight, :volume, :priority_id, :price_per_gram, :price_per_cubic_cm, :transport_company_id, :transport_type_id, :depart_day, :depart_frequency, :duration
  json.url event_url(event, format: :json)
end
