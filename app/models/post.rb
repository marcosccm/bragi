class Post
  attr_accessor :title, :header, :body, :published_at, :slug
  alias :id :slug

  def initialize(file)
    extract_content_from_file(file)
  end

  def formated_date
    @published_at.strftime("%B %d, %Y") if @published_at
  end
  
  def <=>(other)
    self.published_at <=> other.published_at
  end
  
  private

  def extract_content_from_file(file)
    chunks = File.read(file).split("***")
    load_metadata(chunks[0])
    load_body(chunks[1])
  end

  def load_metadata(raw_data = "")
    meta = YAML.load(raw_data) 
    load_title(meta) if meta.has_key? "title"
    load_header(meta) if meta.has_key? "header"
    load_published_at(meta) if meta.has_key? "published_at"
  end

  def load_title(meta)
    @title = meta["title"]
    @slug = @title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def load_header(meta)
    @header = meta["header"]
  end

  def load_published_at(meta)
    @published_at = Date.parse meta["published_at"]
  end

  def load_body(body = "")
    @body = Redcarpet.new(body).to_html
  end
end
