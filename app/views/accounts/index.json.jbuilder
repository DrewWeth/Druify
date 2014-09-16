json.array!(@accounts) do |account|
  json.extract! account, :id, :username, :url, :desc
  json.url account_url(account, format: :json)
end
