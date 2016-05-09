json.array!(@projects) do |project|
  json.extract! project, :id, :name, :description, :token, :parent_project_id
  json.url project_url(project, format: :json)
end
