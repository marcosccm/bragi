class Posts 
  def self.load(posts_path)
    @posts = []
    Dir["#{posts_path}/*"].each { |file| @posts << Post.new(file) } 
  end
end
