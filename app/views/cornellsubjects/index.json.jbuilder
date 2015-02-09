json.array!(@cornellsubjects) do |cornellsubject|
  json.extract! cornellsubject, :prefix, :name
end