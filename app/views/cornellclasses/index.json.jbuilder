json.array!(@cornellclasses) do |cornellclass|
  json.extract! cornellclass, :name
end