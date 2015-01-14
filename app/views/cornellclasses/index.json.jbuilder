json.array!(@cornellclasses) do |cornellclass|
  json.extract! cornellclass, :id, :title, :prefix, :coursenumber, :courseid, :avgrating, :numratings, :created_at, :updated_at
  json.url cornellclass_url(cornellclass, format: :json)
end
