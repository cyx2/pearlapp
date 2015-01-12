json.array!(@ratings) do |rating|
  json.extract! rating, :id, :rater, :rating, :classid, :created_at, :updated_at
  json.url rating_url(rating, format: :json)
end
