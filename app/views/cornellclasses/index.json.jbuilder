json.array!(@cornellclasses) do |cornellclass|
  json.extract! cornellclass, :prefix, :coursenumber, :title
end