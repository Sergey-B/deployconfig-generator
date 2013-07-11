require 'rails/generators/base'
class DeployGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def generate_deploy_config
    directory '../templates', "config/deploy"
  end

end
