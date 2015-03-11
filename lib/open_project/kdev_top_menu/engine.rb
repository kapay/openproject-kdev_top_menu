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

      # menu :real_top_menu, :customizations, {}, :caption => "Customizations", :children => Proc.new {[Redmine::MenuManager::MenuItem.new(:custom_child, 'http://example.com', :caption => "custom child")]}
      menu :real_top_menu, :customization_projects, {:controller => 'projects', :action => 'requirements/wiki/Customization_projects'}, :caption => "Customization projects", :if => Proc.new {User.current.logged?}
      menu :real_top_menu, :requirements, {}, :caption => "Requirements", :if => Proc.new {User.current.logged?}
      menu :real_top_menu, :customization_req, {:controller => 'projects', :action => 'requirements/wiki/Customizations'}, :caption => "Customizations", :parent => :requirements
      menu :real_top_menu, :product_req, {:controller => 'projects', :action => 'requirements/wiki/Products'}, :caption => "Products", :parent => :requirements
      # menu :real_top_menu, :example_art_link2, {:controller => 'projects', :action => 'requirements/wiki/Customizations'}, :caption => "Product Requirements", :parent => :requirements
    end
  end
end
