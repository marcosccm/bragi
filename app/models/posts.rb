class Posts 
  def self.all
    @posts ||= load_posts
    @posts
  end

  def self.ordered
    all.sort.reverse
  end

  def self.find(slug)
    all.select  { |post| post.slug == slug }[0]
  end

  def self.clear
    @posts = nil
  end

  private
  def self.load_posts
    Dir["#{ENV['posts_path']}/*"].map { |file| Post.new(file) } 
  end
end
