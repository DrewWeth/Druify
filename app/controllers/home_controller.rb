class HomeController < ApplicationController
	# GET /accounts
	# GET /accounts.json
	def index

		@news = News.where(:archived => false).take(4)

		# begin
		# 	client = Instagram.client(:access_token => "190528179.56578d4.5959ac46941f40a788474cafb913791b")
		# 	user = client.user
		# 	html=""
		# 	for media_item in client.user_recent_media(options = {"count" => "10"})
		# 		html << "<img src='#{media_item.images.thumbnail.url}'>"
		# 	end
		# 	html << "</center>"
		#
		# 	@html = html.html_safe
		# rescue
		# end


	end


	# 190528179.56578d4.5959ac46941f40a788474cafb913791b # my access_token. This shouldnt be public... o well
	# https://api.instagram.com/v1/users/search?q=[USERNAME]&access_token=[ACCESS TOKEN] # search for id given username
	# https://api.instagram.com/v1/users/190528179/?access_token=190528179.56578d4.5959ac46941f40a788474cafb913791b # me


	def resume
	end

end
