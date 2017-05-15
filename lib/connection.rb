require 'rubygems'
require 'twitter'

class ConnectionS
  def con_client
    client = Twitter::Streaming::Client.new do |config|
  		config.consumer_key        = "key"
  		config.consumer_secret     = "token"
  		config.access_token        = "token"
  		config.access_token_secret = "token"
    end
  end
end

class ConnectionR
  def con_client
    	client = Twitter::REST::Client.new do |config|
  		config.consumer_key        = "key"
  		config.consumer_secret     = "token"
  		config.access_token        = "token"
  		config.access_token_secret = "token"
    end
  end
end