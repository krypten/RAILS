json.array!(@card_infos) do |card_info|
  json.extract! card_info, :id, :card_no, :card_holdername, :card_exp_date, :card_pin
  json.url card_info_url(card_info, format: :json)
end
