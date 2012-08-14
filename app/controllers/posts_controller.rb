class PostsController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.atom
    end
  end

  def show
  end

  private

  def post 
    Posts.find(params[:id])
  end
  helper_method :post

  def posts
    Posts.ordered
  end
  helper_method :posts
end
