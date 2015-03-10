# encoding: UTF-8
$:.push File.expand_path("../lib", __FILE__)

require 'open_project/kdev_top_menu/version'
# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "openproject-kdev_top_menu"
  s.version     = OpenProject::KdevTopMenu::VERSION
  s.authors     = "Art A"
  s.email       = "some@email"
  s.homepage    = "https://www.openproject.org/projects/kdev-top-menu"  # TODO check this URL
  s.summary     = 'OpenProject Kdev Top Menu'
  s.description = 'Adds additional top menu items'
  s.license     = '' # e.g. "MIT" or "GPLv3"

  s.files = Dir["{app,config,db,lib}/**/*"] + %w(CHANGELOG.md README.md)

  s.add_dependency "rails", "~> 3.2.14"
end
