json.array!(@pricings) do |pricing|
  json.extract! pricing, :id, :seat_type, :price
  json.url pricing_url(pricing, format: :json)
end
