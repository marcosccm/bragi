class Author
  include Mongoid::Document
  field :name
  field :email
  field :password_hash
  field :password_salt

  attr_accessor :password
  validates :password, :presence => true

  before_create :encrypt_password

  def self.authenticate(email, password)
    author = first(:conditions => { :email => email})
    if author && author.password_hash = BCrypt::Engine.hash_secret(password, author.password_salt)
      author
    end
  end

  private
  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end
end
