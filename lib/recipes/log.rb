Capistrano::Configuration.instance.load do
  namespace :log do
    desc "Tail all application log files"
    task :tail, :roles => :app do
      log_name = ENV.fetch('LOG_NAME') { '*' }
      run "tail -f -n 100 #{shared_path}/log/#{log_name}.log" do |channel, stream, data|
        puts "#{channel[:host]}: #{data}"
        break if stream == :err
      end
    end
  end
end
