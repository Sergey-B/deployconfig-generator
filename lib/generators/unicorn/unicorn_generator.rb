require 'rails/generators/base'
class UnicornGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  desc "This generator creates an unicorn.rb file at config/deploy"

  def generate_unicorn_config
    copy_file "unicorn.rb", "config/unicorn.rb"
  end

end
