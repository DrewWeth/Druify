class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]


  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = Account.all
    @is_admin = is_admin

  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
    @is_admin = is_admin
  end

  # GET /accounts/new
  def new
    @account = Account.new
    restricted
  end

  # GET /accounts/1/edit
  def edit
    @is_admin = is_admin
    restricted
  end

  # POST /accounts
  # POST /accounts.json
  def create
    restricted
    @account = Account.new(account_params)

    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: 'Account was successfully created.' }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    restricted
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    if !is_admin
      respond_to do |format|
        format.html { redirect_to action: "index" }
        format.js { head :ok }
      end
    else
      @account.destroy
      respond_to do |format|
        format.html { redirect_to accounts_url, notice: 'Account was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    def is_admin
      if current_user != nil and current_user.id == 1
        return true
      else
        return false
      end
    end

    def restricted
      if !is_admin
        redirect_to action: "index" and return
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:username, :url, :desc)
    end
end
