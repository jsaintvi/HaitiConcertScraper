json.array!(@movies) do |movie|
  json.extract! movie, :id, :title, :hotness, :image_url, :summary, :rating, :genre, :director, :release_date, :duration, :user_id
  json.url movie_url(movie, format: :json)
end
