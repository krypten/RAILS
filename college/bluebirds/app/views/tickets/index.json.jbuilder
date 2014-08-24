json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :Viewing_id, :show_date, :Order_id
  json.url ticket_url(ticket, format: :json)
end
