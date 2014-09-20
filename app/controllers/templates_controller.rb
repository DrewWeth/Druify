class TemplatesController < ApplicationController
  before_action :set_template, only: [:show, :edit, :update, :destroy]

  def next
    # next_temp = params[:id].to_i + 1
    temp = Template.offset(rand(Template.count)).first.bgUrl
    render :text => temp
  end


  # GET /templates
  # GET /templates.json
  def index
    @templates = Template.all

  end

  # GET /templates/1
  # GET /templates/1.json
  def show

  end


  # GET /templates/new
  def new
    @template = Template.new
    restricted
  end

  # GET /templates/1/edit
  def edit
    restricted
  end

  # POST /templates
  # POST /templates.json
  def create
    restricted
    @template = Template.new(template_params)

    respond_to do |format|
      if @template.save
        format.html { redirect_to @template, notice: 'Template was successfully created.' }
        format.json { render :show, status: :created, location: @template }
      else
        format.html { render :new }
        format.json { render json: @template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /templates/1
  # PATCH/PUT /templates/1.json
  def update
    restricted
    respond_to do |format|
      if @template.update(template_params)
        format.html { redirect_to @template, notice: 'Template was successfully updated.' }
        format.json { render :show, status: :ok, location: @template }
      else
        format.html { render :edit }
        format.json { render json: @template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /templates/1
  # DELETE /templates/1.json
  def destroy
    if !is_admin
      respond_to do |format|
        format.html { redirect_to action: "index" }
        format.js { head :ok }
      end
    else
      @template.destroy
      respond_to do |format|
        format.html { redirect_to templates_url, notice: 'Template was successfully destroyed.' }
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
        redirect_to action: "index"
        return
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_template
      @template = Template.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def template_params
      params.require(:template).permit(:name, :bgUrl, :accentColor, :headerColor, :linkColor, :unvisitedLinkColor, :darkClassColor)
    end
end
