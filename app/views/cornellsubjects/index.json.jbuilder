json.array!(@cornellsubjects) do |cornellsubject|
  json.extract! cornellsubject, :id, :prefix
  json.url cornellsubject_url(cornellsubject, format: :json)
end
