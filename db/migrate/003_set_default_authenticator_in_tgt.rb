class SetDefaultAuthenticatorInTgt < ActiveRecord::Migration
  def self.up
    change_column 'casserver_tgt', 'authenticator', :string, :limit => 64, :null => false, :default => 'CASServer::Authenticators::SQLEncrypted'
    execute "UPDATE `casserver_tgt` SET `authenticator` =  'CASServer::Authenticators::SQLEncrypted' WHERE `authenticator` = '';"
  end

  def self.down
    change_column 'casserver_tgt', 'authenticator', :string, :limit => 64, :null => false, :default => nil
  end
end
