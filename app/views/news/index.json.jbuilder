json.array!(@news) do |news|
  json.extract! news, :id, :title, :content, :archived
  json.url news_url(news, format: :json)
end
