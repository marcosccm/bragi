class PostsController < ApplicationController
  expose(:post) { Posts.find(params[:id]) }
  expose(:posts) { Posts.ordered }

  def index
    respond_to do |format|
      format.html
      format.atom
    end
  end

  def show
  end
end
