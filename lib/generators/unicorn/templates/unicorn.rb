#unicorn.rb
worker_processes (ENV['WORKER_COUNT'] || 4).to_i

preload_app true
timeout 30

application_name ='your application name'
socket_name = application_name

deploy_dir = "/var/www/#{application_name}/ss"

listen "/var/www/#{application_name}/ss/shared/tmp/sockets/unicorn.sock", :backlog => 1024

working_directory "#{deploy_dir}/current/"
pid               "#{deploy_dir}/shared/pids/unicorn.pid"
stderr_path       "#{deploy_dir}/shared/log/unicorn.stderr.log"
stdout_path       "#{deploy_dir}/shared/log/unicorn.stdout.log"

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end
