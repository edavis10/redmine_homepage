require 'homepage'

HOMEPAGE_CONFIGURATION_FILE = File.join(Rails.root, "config/homepage.yml")

if File.exists? HOMEPAGE_CONFIGURATION_FILE
  Homepage.config = YAML.load(File.read(HOMEPAGE_CONFIGURATION_FILE))
else
  raise "Missing Homepage Configuration file.  Please create a 'config/homepage.yml'"
end

  
Redmine::Plugin.register :redmine_homepage do
  name 'Redmine Homepage'
  author 'Eric Davis'
  url 'https://projects.littlestreamsoftware.com/projects/redmine-misc'
  author_url 'http://www.littlestreamsoftware.com'
  description "Configure the Redmine homepage to be a specific page"
  version '0.1.0'

  requires_redmine :version_or_higher => '0.8.0'
end

