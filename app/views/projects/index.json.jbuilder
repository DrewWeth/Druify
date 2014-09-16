json.array!(@projects) do |project|
  json.extract! project, :id, :name, :url, :started, :summary, :desc, :img
  json.url project_url(project, format: :json)
end
