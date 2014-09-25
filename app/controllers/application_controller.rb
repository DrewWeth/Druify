class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_default_params

  def set_default_params

    # Bunch of templating stuff
    session[:template] ||= 2 # Default
    template = Template.find(session[:template])
    @bg = template.bgUrl
    @header_bg = template.headerColor
    if !template.accentColor.blank?
      @accent = template.accentColor
    else
      @accent = "transparent"
    end
    @linkColor = template.linkColor
    @unvisitedLinkColor = template.unvisitedLinkColor
    @block = template.darkClassColor


    # Bump counter
  	util = Utility.take
  	util.visits += 1
  	util.save
  	@count = util.visits
  end
end
