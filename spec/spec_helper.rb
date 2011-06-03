ENV["RAILS_ENV"] ||= "test"

PROJECT_ROOT = File.expand_path("../..", __FILE__)
$LOAD_PATH << File.join(PROJECT_ROOT, "lib")

require 'rails/all'
Bundler.require

require 'rails/test_help'
require 'rspec/rails'

require 'simples3'