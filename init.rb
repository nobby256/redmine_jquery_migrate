require 'redmine'

Rails.configuration.to_prepare do
  require_dependency 'application_helper'
  ApplicationHelper.send(:include, JqueryMigratePatch)
end

Redmine::Plugin.register :redmine_jquery_migrate do
  name 'Redmine Jquery Migrate plugin'
  author 'Nobby'
  description 'The plugin restores deprecated features and behaviors so that older code will still run properly on jQuery 1.9 and later. '
  version '0.0.1'
  url 'https://github.com/nobby256/redmine_jquery_migrate.git'
end
