json.array!(@cornell_classes) do |cornell_class|
  json.extract! cornell_class, :id, :title, :prefix, :course_number, :avgrating, :numratings, :created_at, :updated_at
  json.url cornell_class_url(cornell_class, format: :json)
end
