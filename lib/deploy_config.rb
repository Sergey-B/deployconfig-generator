  require 'capistrano'
  require 'capistrano/cli'
  require 'capistrano'
  require "capistrano-rbenv"
  require "bundler/capistrano"
  # require "whenever/capistrano"
  # require "delayed/recipes"
  require "dotenv/capistrano"

Dir[File.join(File.dirname(__FILE__), '/recipes/*.rb')].sort.each { |f| load f }
