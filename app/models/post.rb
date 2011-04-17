class Post
  include Mongoid::Document
  field :title
  field :body
  field :slug

  before_create :create_slug
  validates :title, :presence => true
  validates :body, :presence => true

  private
  def create_slug
    self.slug = self.title.gsub(/[^a-z0-9']+/, "_")
  end
end
