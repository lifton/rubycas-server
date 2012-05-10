class TrackAuthenticatorInTgt < ActiveRecord::Migration
  def self.up
    add_column 'casserver_tgt', 'authenticator', :string, :limit => 64, :null => false
  end

  def self.down
    remove_column 'casserver_tgt', 'authenticator'
  end
end
