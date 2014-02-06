$:.push File.expand_path('../lib', __FILE__)

require 'deploy_config/version'

Gem::Specification.new do |s|
  s.name        = 'deployconfig'
  s.version     = DeployConfig::VERSION
  s.platform    = 'ruby'
  s.authors     = ['Sergey Belov, Vladimir Lyzo, Sergey Ponomarev']
  s.email       = ['']
  s.homepage    = ''
  s.summary     = %q{ Salt & Pepper best practice deploy }
  s.description = %q{Provide generators for unicorn and capistrano multistage config}
  s.files = Dir.glob('{lib}/**/*')
  s.require_path = 'lib'
  s.add_development_dependency 'rails', '~> 3.2.0'
  s.add_dependency 'capistrano', '> 2'
  s.add_dependency 'capistrano-ext', '>= 1.2.1'
  s.add_dependency 'capistrano-rbenv','>= 1.0.0'
  s.add_dependency 'dotenv-rails'
end
