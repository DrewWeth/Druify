json.array!(@posts) do |post|
  json.extract! post, :id, :title, :desc, :content, :url, :category
  json.url post_url(post, format: :json)
end
