class PostsController < ApplicationController
  expose(:post) { Posts.find(params[:id]) }
  expose(:posts) { Posts.all }

  def index
    respond_to do |format|
      format.atom
    end
  end

  def show
  end
end
