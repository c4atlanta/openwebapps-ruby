class AddContactInfoToApp < ActiveRecord::Migration
  def self.up
    add_column :apps, :contact_email, :string
    add_column :apps, :twitter_account, :string
  end

  def self.down
    remove_column :apps, :twitter_account
    remove_column :apps, :contact_email
  end
end
