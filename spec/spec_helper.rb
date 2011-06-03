# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require 'fileutils'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/rspec'

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    config.mock_with :rspec

    # clear all fixture posts before each test
    config.after :each do
      clear_files
      Posts.clear
    end
    

    def clear_files
      dir = ENV['posts_path']
      Dir.entries(dir).each do |file|
        path = File.join(dir, file)
        next if File.directory?(path) || file.start_with?(".")
        File.delete path
    end 
  end
end
