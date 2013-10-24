# Readme

    Provide unicorn and capistrano multistage config generators

## Installation

Add it to your Gemfile

    gem 'deployconfig'

Ensure you have the Capistrano gem installed:

    gem 'capistrano'

Optionally install the Capistrano extensions gem to give you multistage support:

    gem 'capistrano-ext'

For use dotenv:

    gem 'dotenv-rails'

Then simply run it:

    bundle install

To setup the initial Capistrano deploy file, go to your Rails app folder via command line and enter:

    capify .

Inside the newly created config/deploy.rb, add:

    require 'capistrano/ext/multistage' # only require if you've installed Cap ext gem

This one should go at the end of your deploy.rb

    require 'deploy_config'

To create config/deploy directory with files test.rb and production.rb run:

    rails g deploy

To create unicorn.rb in config run:

    rails g unicorn

