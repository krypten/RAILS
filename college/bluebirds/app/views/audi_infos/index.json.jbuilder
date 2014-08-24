json.array!(@audi_infos) do |audi_info|
  json.extract! audi_info, :id, :screen_no, :seat_no, :Pricing_id
  json.url audi_info_url(audi_info, format: :json)
end
