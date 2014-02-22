json.array!(@requests) do |request|
  json.extract! request, :id, :meter_id, :paytime, :duration, :status
  json.url request_url(request, format: :json)
end
