json.array!(@couriers) do |courier|
  json.extract! courier, :id, :receiver_name, :contact_no, :address
  json.url courier_url(courier, format: :json)
end
