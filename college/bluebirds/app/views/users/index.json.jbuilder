json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :contact_no
  json.url user_url(user, format: :json)
end
