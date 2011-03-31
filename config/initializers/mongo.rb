if ENV['MONGO_URI']
  MongoMapper.config = {RAILS_ENV => {'uri' => ENV['MONGO_URI']}}
else
  MongoMapper.config = {RAILS_ENV => {'uri' => 'mongodb://localhost/sushi'}}
end

MongoMapper.connect(RAILS_ENV)
