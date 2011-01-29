class CreateApps < ActiveRecord::Migration
  def self.up
    create_table :apps do |t|
      t.string :name
      t.text :description
      t.string :base_url
      t.string :launch_path
      t.text :app_urls
      t.text :capabilities
      t.string :developer_name
      t.string :developer_url
      t.string :defaultLocale
      t.text :locales
      t.datetime :release

      t.timestamps
    end
  end

  def self.down
    drop_table :apps
  end
end
