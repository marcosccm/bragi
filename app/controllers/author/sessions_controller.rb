class Author::SessionsController < ApplicationController 
  def new 

  end

  def create
    author = Author.authenticate(params[:email], params[:password])
    if author
      session[:author_id] = author.id
      redirect_to author_posts_path, :notice => "Succefully logged in"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end
end
