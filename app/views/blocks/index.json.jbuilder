json.array!(@blocks) do |block|
  json.extract! block, :id, :address, :lat, :lon, :rate, :limit, :count, :fromDay, :toDay, :fromHour, :toHour, :status
  json.url block_url(block, format: :json)
end
