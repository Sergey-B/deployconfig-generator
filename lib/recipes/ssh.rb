# encoding: utf-8
Capistrano::Configuration.instance.load do
  namespace :ssh do
    desc 'Generate ssh key'
    task :keygen, roles: :app, except: { no_release: true } do
      run 'rm -f ~/.ssh/id_rsa ~/.ssh/id_rsa.pub' if ENV['FORCE']

      run 'ssh-keygen -q -b 4096 -t rsa -N "" -f ~/.ssh/id_rsa'
    end

    desc 'Read public ssh key'
    task :cat_pub, roles: :app, except: { no_release: true } do
      run 'cat ~/.ssh/id_rsa.pub'
    end

    desc 'Start a SSH connection to remote server'
    task :connect do
      servers = find_servers_for_task(current_task)
      case servers.count
      when 0
        logger.debug 'no servers found'
      when 1
        ssh_connect servers.first
      else
        HighLine.new.choose do |menu|
          menu.prompt = 'Please choose your server: '
          menu.choices(*servers.map(&:host)) {|choice| ssh_connect servers.select { |s| s.host == choice }.first }
        end
      end
    end
  end

  def ssh_connect(server)
    Capistrano::SSH.connection_strategy(server, self) do |host, user, options|
      params =  "#{user}@#{host}"
      params += " -p #{options[:port]}" unless options[:port].nil?
      logger.debug "connecting to #{host}"
      logger.info "password: #{password}" if self.variables[:password].kind_of?(String)
      params += %{ -t "cd #{fetch(:ssh_default_dir)} && bash -l"} if self[:ssh_default_dir]
      exec "ssh #{params}"
    end
  end

  after 'ssh:keygen', 'ssh:cat_pub'

end

