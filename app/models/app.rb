class App < ActiveRecord::Base
  serialize :app_urls
  serialize :capabilities
  serialize :locales

  self.include_root_in_json = false

  after_initialize :set_defaults
  before_validation :check_app_urls

  attr_protected :approved, :category

  scope :unapproved, :conditions => { :approved => false }

  def set_defaults
    self.app_urls ||= []
    self.capabilities ||= []
    self.locales ||= { }
    self.defaultLocale ||= "en-US"
    self.category ||= "Unsorted"
  end

  def check_app_urls
    unless app_urls.include?(base_url)
      app_urls.unshift base_url
    end
  end

  def developer
    { :name => developer_name, :url => developer_url}
  end

  def icons
    { '96' => icon_path }
  end

  def icon_url
    icon_path =~ /^data:/ ? icon_path : "#{base_url}#{icon_path}"
  end

  def as_json(options={})
    super(:except => [:developer_name, :developer_url, :created_at,
                      :updated_at, :twitter_account, :contact_email,
                     :icon_path, :category, :approved, :id],
          :methods => [:developer, :release, :icons])
  end

  def manifest
    to_json
  end

  def release
    updated_at.iso8601
  end
end
