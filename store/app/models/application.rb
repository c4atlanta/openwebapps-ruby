class Application < ActiveRecord::Base
  serialize :app_urls
  serialize :capabilities
  serialize :locales
  self.include_root_in_json = false

  def after_initialize
    self.app_urls ||= []
    self.capabilities ||= []
    self.locales ||= { }
  end

  def developer
    { :name => developer_name, :url => developer_url}
  end

  def manifest
    self.to_json(:methods => [:developer])
  end
end
