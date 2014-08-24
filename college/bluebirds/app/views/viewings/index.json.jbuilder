json.array!(@viewings) do |viewing|
  json.extract! viewing, :id, :Movie_id, :AudiInfo_id, :timing
  json.url viewing_url(viewing, format: :json)
end
