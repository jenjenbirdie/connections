class RenameEmailAddressToEmail < ActiveRecord::Migration
  def self.up
     rename_column :users, :email_address, :email
  end

  def self.down
	 rename_column :users, :email_address, :email
  end
end
