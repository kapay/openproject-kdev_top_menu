# Prevent load-order problems in case openproject-plugins is listed after a plugin in the Gemfile
# or not at all
require 'open_project/plugins'

module OpenProject::KdevTopMenu
  class Engine < ::Rails::Engine
    engine_name :openproject_kdev_top_menu

    include OpenProject::Plugins::ActsAsOpEngine

    register 'openproject-kdev_top_menu',
             :author_url => 'http://example.com',
             :requires_openproject => '>= 4.0.0' do

      menu :real_top_menu, :example_art_link, {:controller => 'projects', :action => 'requirements/wiki/Customization_status_page'}, :caption => "Customization Requests"
      menu :real_top_menu, :example_art_link2, {:controller => 'projects', :action => 'requirements/wiki/Customizations'}, :caption => "Product Requirements"
    end
  end
end
