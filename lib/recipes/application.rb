Capistrano::Configuration.instance.load do

  set :git_application_name,             defer{ application }
  set :deploy_to_application_name , defer{ application }

  set :deploy_env, defer { rails_env }
  set :use_sudo, false

  # Capistrano config
  set :scm, :git
  set :repository, defer { "ssh://git@git.snpdev.ru:42204/#{application}.git" }
  #set :branch, "master"
  set :git_shallow_clone, 1 # only master branch
  set :deploy_to, defer { "/var/www/#{deploy_to_application_name}" }

  set :deploy_via, :remote_cache
  set :copy_exclude, ['.git']

  # Assets
  set :normalize_asset_timestamps, false

  # Bundle config
  set :bundle_binary, "bundle"
  set :bundle_flags,  "--deployment --binstubs"
  set :bundle_without, defer { [:development, :test, :production] - [ rails_env ] }

  # Unicorn config
  set :unicorn_binary, "unicorn"
  #set :unicorn_config, defer { "#{current_path}/config/unicorn/#{stage}.rb" }
  set :unicorn_config, defer { "#{current_path}/config/unicorn.rb" }
  set :unicorn_pid, defer { "#{deploy_to}/shared/pids/unicorn.pid" }

  # Whenever config
  set :whenever_command, "#{try_sudo} #{bundle_binary} exec whenever"
  set :whenever_environment, defer { rails_env }
  set :whenever_identifier, defer { "#{application}_#{stage}" }


  set :stages, %w(testing production)
  set :default_stage, "testing"

  set :application,                             defer{ application }
  set :symlinks,  [ { :label => :db, :path => 'config/database.yml' } ]
  # rbenv
  set :rbenv_ruby_version, "1.9.3-p392"

end
