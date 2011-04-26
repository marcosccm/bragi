class Post
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title
  field :body
  field :body_html
  key :title

  attr_accessible :title, :body
  validates :title, :presence => true
  validates :body, :presence => true
  before_save :update_html_body

  private
  def update_html_body
    self.body_html = Redcarpet.new(self.body).to_html
  end
end
