# Readme

    Provide generators for unicorn and capistrano multistage config

## Installation

Add it to your Gemfile

    gem 'deployconfig-generator'

Ensure you have the Capistrano gem installed:

    gem 'capistrano'

Optionally install the Capistrano extensions gem to give you multistage support:

    gem 'capistrano-ext'

Then simply run it:

    bundle install

Inside the newly created config/deploy.rb, add:

    require 'capistrano/ext/multistage' # only require if you've installed Cap ext gem

  # This one should go at the end of your deploy.rb

    require 'capistrano_recipes'

To setup the initial Capistrano deploy file, go to your Rails app folder via command line and enter:

    capify .

To create config/deploy directory with files testing.rb and production.rb run:

    rails g deploy

To create unicorn.rb in config run:

    rails g unicorn

