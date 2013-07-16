require 'rails/generators/base'
class DeployGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  desc "This generator creates config/deploy folder with config files for production and testing stage"

  def generate_deploy_config
    directory '../templates', "config/deploy"
  end

end
