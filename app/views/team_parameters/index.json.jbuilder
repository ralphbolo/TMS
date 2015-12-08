json.array!(@team_parameters) do |team_parameter|
  json.extract! team_parameter, :id, :min, :max, :deadline, :courseCode
  json.url team_parameter_url(team_parameter, format: :json)
end
