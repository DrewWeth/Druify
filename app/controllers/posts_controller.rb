require 'blogger'
require 'net/http'

class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index

    @posts = Post.all
    @is_admin = is_admin
    begin
      response = HTTParty.get('https://www.googleapis.com/blogger/v3/blogs/6736525613745104618?key=AIzaSyAdv2hpDnVGqgUzsOhXVCOWrRM0VUJ1Pfs')
      posts = HTTParty.get('https://www.googleapis.com/blogger/v3/blogs/6736525613745104618/posts?key=AIzaSyAdv2hpDnVGqgUzsOhXVCOWrRM0VUJ1Pfs')
      @story = posts["items"]
    rescue
      @story = []
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
   @is_admin = is_admin

  end

  # GET /posts/new
  def new
    @post = Post.new
    restricted
  end

  # GET /posts/1/edit
  def edit
    restricted

  end

  # POST /posts
  # POST /posts.json
  def create
    restricted

    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    restricted

    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    if !is_admin
      respond_to do |format|
        format.html { redirect_to action: "index" }
        format.js { head :ok }
      end
    else
      @post.destroy
      respond_to do |format|
        format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    


    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :desc, :content, :url, :category)
    end
end
