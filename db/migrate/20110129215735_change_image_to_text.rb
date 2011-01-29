class ChangeImageToText < ActiveRecord::Migration
  def self.up
    change_column :apps, :icon_path, :text
  end

  def self.down
    change_column :apps, :icon_path, :string
  end
end
