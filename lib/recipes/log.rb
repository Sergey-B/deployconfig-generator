Capistrano::Configuration.instance.load do
  namespace :log do
    desc "Tail all application log files"
    task :tail, :roles => :app do
      log_name = ENV.fetch('LOG_NAME') { "*" }
      run "ls  #{shared_path}/log/" do |channel, stream, data|
        remote_logs = data.split
        HighLine.new.choose do |menu|
          menu.prompt = 'Please select log: '
          menu.choices(*remote_logs) do |choice|
            choice = choice.sub(/.log$/,'\\1')
            run "tail -f -n 100 #{shared_path}/log/#{choice}.log" do |channel, stream, data|
              puts "#{channel[:host]}: #{data}"
              break if stream == :err
            end
          end
        end
      end
    end
  end
end
