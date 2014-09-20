json.array!(@templates) do |template|
  json.extract! template, :id, :bgUrl, :accentColor, :headerColor, :linkColor, :unvisitedLinkColor, :darkClassColor
  json.url template_url(template, format: :json)
end
