json.array!(@applications) do |application|
  json.extract! application, :id, :url, :user_id
  json.url application_url(application, format: :json)
end
