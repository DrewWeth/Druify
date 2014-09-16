class HomeController < ApplicationController
  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = Account.all
  end
  def resume
    
  end
end
