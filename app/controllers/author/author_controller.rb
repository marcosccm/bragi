class AuthorController < ApplicationController
  before_filter :check_logged_author

  private
  def check_logged_author
    redirect_to posts_path, :alert => "you must log in to access that area" unless session[:author_id]
  end
end
