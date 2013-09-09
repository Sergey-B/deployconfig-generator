# test.rb
set :rails_env, :test

# Настраиваем ssh до сервера
server "192.168.122.102", :app, :web, :db, :primary => true

# Авторизационные данные
set :user, 'username'
set :group, 'group'
set :password, 'password'
set :keep_releases, 10
