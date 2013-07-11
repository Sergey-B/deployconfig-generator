# Readme

Useful Capistrano recipes including:


## Installation

Add it to your Gemfile

    gem 'melonjs-generator'

Ensure you have the Capistrano gem installed:

  gem 'capistrano'

Optionally install the Capistrano extensions gem to give you multistage support:

  gem 'capistrano-ext'

To setup the initial Capistrano deploy file, go to your Rails app folder via command line and enter:

  capify .

Then simply run it:

    bundle install

To create config/deploy directory with files testing.rb and production.rb run:

    rails g deploy

To create unicorn.rb in config run:

    rails g unicorn

