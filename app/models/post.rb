class Post
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title
  field :body
  key :title

  attr_accessible :title, :body
  validates :title, :presence => true
  validates :body, :presence => true
end
