class AddIconsToApp < ActiveRecord::Migration
  def self.up
    add_column :apps, :icon_path, :string
  end

  def self.down
    remove_column :apps, :icon_path
  end
end
