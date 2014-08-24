json.array!(@orders) do |order|
  json.extract! order, :id, :quantity, :total_amount, :payment_success, :mode_of_collection, :Courier_id, :BillingInfo_id, :User_id
  json.url order_url(order, format: :json)
end
