Capistrano::Configuration.instance.load do
  namespace :log do
    desc "Tail all application log files"
    task :tail, :roles => :app do
      run "tail -f -n 100 #{shared_path}/log/*.log" do |channel, stream, data|
        puts "#{channel[:host]}: #{data}"
        break if stream == :err
      end
    end
  end
end
