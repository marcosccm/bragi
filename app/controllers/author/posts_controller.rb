class Author::PostsController < Author::AuthorController
  expose(:post)
  expose(:posts) { Post.all }

  def index
  end

  def new
  end
  
  def create
    if post.save
      redirect_to author_posts_path, :notice => "Post created successfully"
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if post.update_attributes(params[:post])
      redirect_to author_posts_path, :notice => "Post edited successfully"
    else
      render "edit"
    end
  end

  def destroy 
    post.destroy
    redirect_to author_posts_path, :notice => "Post removed successfully"
  end
end
