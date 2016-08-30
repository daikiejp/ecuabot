
#!/usr/bin/env ruby

require 'twitter'

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "YOUR-API-KEY-HERE"
  config.consumer_secret     = "YOUR-API-KEY-SECRET-HERE"
  config.access_token        = "YOUR-ACCESS-TOKEN-HERE"
  config.access_token_secret = "YOUR-ACCESS-TOKEN-SECRET-HERE"
end

client.search("#Ecuador -RT").take(1).each do |tweet|
puts tweet.user.screen_name
puts tweet.text
client.retweet(tweet)
client.follow(tweet.user.screen_name)
end
