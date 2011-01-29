class AddApprovedToApp < ActiveRecord::Migration
  def self.up
    add_column :apps, :approved, :boolean, :default => false
  end

  def self.down
    remove_column :apps, :approved
  end
end
