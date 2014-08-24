json.array!(@movies) do |movie|
  json.extract! movie, :id, :movie_name, :description, :duration, :image_url, :language, :certificate, :release_date
  json.url movie_url(movie, format: :json)
end
