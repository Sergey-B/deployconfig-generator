Capistrano::Configuration.instance.load do
  namespace :ssh do
  desc "Generate ssh key"
  task :keygen, :roles => :app, :except => { :no_release => true } do
    if ENV['FORCE']
      run 'rm -f ~/.ssh/id_rsa ~/.ssh/id_rsa.pub'
    end

    run 'ssh-keygen -q -b 4096 -t rsa -N "" -f ~/.ssh/id_rsa'
  end

  desc "Read public ssh key"
  task :cat_pub, :roles => :app, :except => { :no_release => true } do
    run 'cat ~/.ssh/id_rsa.pub'
  end
end

after 'ssh:keygen', 'ssh:cat_pub'

end