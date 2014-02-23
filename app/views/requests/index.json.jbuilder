json.array!(@requests) do |request|
  json.extract! request, :id, :meter_id, :paytime, :duration, :expire_in, :status
  json.url request_url(request, format: :json)
end
