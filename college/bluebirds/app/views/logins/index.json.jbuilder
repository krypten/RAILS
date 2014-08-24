json.array!(@logins) do |login|
  json.extract! login, :id, :username, :password_hash, :password_salt, :User_id
  json.url login_url(login, format: :json)
end
