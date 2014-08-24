json.array!(@tmps) do |tmp|
  json.extract! tmp, :id, :k, :h
  json.url tmp_url(tmp, format: :json)
end
