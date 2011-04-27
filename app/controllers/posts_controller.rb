class PostsController < ApplicationController
  expose(:post)
  expose(:posts) { Post.all }

  def index
  end

  def show
  end
end
