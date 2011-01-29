class AddCategoryToApp < ActiveRecord::Migration
  def self.up
    add_column :apps, :category, :string
  end

  def self.down
    remove_column :apps, :category
  end
end
