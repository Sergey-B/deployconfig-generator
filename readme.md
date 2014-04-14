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

# Usage

## Additional Capistrano Recipes

- [cap symlink:local_upload](##cap symlink:local_upload)
- [cap ssh:keygen](##cap ssh:keygen)
- [cap ssh:cat_pub](##cap ssh:cat_pub)
- [cap ssh:connect](##cap ssh:connect)

## cap symlink:local_upload

Upload symlink files:

Example of config to add an symlink files for `/config/database.yml`, `.env` and `/config/application.yml`:

```
set :symlinks,  [
  { label: :db, path: 'config/database.yml' },
  { label: :dotenv, path: '.env' },
  { label: :figaro, path: 'config/application.yml' }
]
```

After that you can upload symlink files with command:

```bash
$ cap symlink:local_upload LABELS='db, figaro,env'
```

## cap ssh:keygen

Generate ssh key on remote server:

```bash
$ cap ssh:keygen
```

## cap ssh:cat_pub

Read public ssh key from remote server:

```bash
$ cap ssh:cat_pub
```

## cap ssh:connect

Start a SSH connection to remote server:

```bash
$ cap ssh:connect
```

you may define default ssh dir in your `/config/deploy/deploy.rb` :

```
set :ssh_default_dir, '/var/www/you-app-name/ss/current'
```