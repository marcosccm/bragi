class Post
  attr_accessor :title, :body, :published_at, :slug
  alias :id :slug

  def initialize(file)
    extract_content_from_file(file)
  end

  private
  def extract_content_from_file(file)
    chunks = File.read(file).split("\n\n")
    load_metadata(chunks[0])
    load_body(chunks[1])
  end

  def load_metadata(raw_data)
    meta = YAML::parse(raw_data)["metadata"] 
    @title = meta["title"].value
    @slug = @title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    @published_at = DateTime.parse(meta["published_at"].value)
  end

  def load_body(body)
    @body = Redcarpet.new(body).to_html
  end
end
