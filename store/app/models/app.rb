class App < ActiveRecord::Base
  serialize :app_urls
  serialize :capabilities
  serialize :locales
  self.include_root_in_json = false

  def after_initialize
    self.app_urls ||= []
    self.capabilities ||= []
    self.locales ||= { }
    self.defaultLocale ||= "en-US"
  end

  def developer
    { :name => developer_name, :url => developer_url}
  end

  def as_json(options = nil) #:nodoc:
    hash = Serializer.new(self, options).serializable_record
    hash = { options[:root] || self.class.model_name.element => hash } if include_root_in_json
    hash
  end

  def as_json(options={})
    super(:except => [:developer_name, :developer_url, :created_at, :updated_at], :methods => [:developer])
  end

  def manifest
    to_json
  end
end
