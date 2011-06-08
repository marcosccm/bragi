class PostFactory
  def self.create(filename, data={})
    file_path = "#{ENV["posts_path"]}/#{filename}"

    File.open(file_path,"w") do |f|
      f.puts("title: #{data[:title]}") if (data.has_key?(:title))
      f.puts("published_at: #{data[:published_at]}") if data.has_key?(:published_at)
      f.puts("header: #{data[:header]}") if (data.has_key?(:header))
      f.puts("***") if data.keys.any?
      f.puts(data[:body])
    end

    Post.new(file_path)
  end
end
