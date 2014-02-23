json.array!(@meters) do |meter|
  json.extract! meter, :id, :lat, :long, :block_id, :meter_number, :rate, :status
  json.url meter_url(meter, format: :json)
end
