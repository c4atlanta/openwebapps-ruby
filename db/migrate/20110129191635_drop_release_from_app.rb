class DropReleaseFromApp < ActiveRecord::Migration
  def self.up
    remove_column :apps, :release
  end

  def self.down
    add_column :apps, :release, :datetime
  end
end
