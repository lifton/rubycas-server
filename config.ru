require 'rubygems'
require "#{File.dirname(__FILE__)}/../console-auth/lib/console_auth"

# Assume all necessary gems are in place if bundler is not installed.
begin
  require 'bundler/setup'
rescue LoadError => e
  raise e unless e.message =~ /no such file to load -- bundler/
end

$:.unshift "#{File.dirname(__FILE__)}/lib"
require "casserver"

::ConsoleAuth.init

use Rack::Session::Cookie,
  :key    => 'tgt',
  :path   => '/cas',
  :secret => ::ConsoleAuth.get_config['authentication']['session_secret']


use Rack::ShowExceptions
use Rack::Runtime
use Rack::CommonLogger

run CASServer::Server.new
