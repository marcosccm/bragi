class PostsController < ApplicationController
  expose(:post) { Posts.find(params[:id]) }
  expose(:posts) { Posts.all }

  def index
  end

  def show
  end
end
