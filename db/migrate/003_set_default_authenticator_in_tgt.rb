class SetDefaultAuthenticatorInTgt < ActiveRecord::Migration
  @postgres = ActiveRecord::Base.connection.adapter_name.downcase =~ /postgres/

  def self.up
    change_column 'casserver_tgt', 'authenticator', :string, :limit => 64, :null => false, :default => 'CASServer::Authenticators::SQLEncrypted'
    if @postgres
      execute "UPDATE \"casserver_tgt\" SET \"authenticator\" =  'CASServer::Authenticators::SQLEncrypted' WHERE \"authenticator\" = '';"
    else
      execute "UPDATE `casserver_tgt` SET `authenticator` =  'CASServer::Authenticators::SQLEncrypted' WHERE `authenticator` = '';"
    end
  end

  def self.down
    change_column 'casserver_tgt', 'authenticator', :string, :limit => 64, :null => false, :default => nil
  end
end
