class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_default_params

  def set_default_params

    # Bump counter
  	util = Utility.take
  	util.visits += 1
  	util.save
  	@count = util.visits
  end
end
