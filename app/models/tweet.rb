require "httparty"
require "base64"


# {"token_type"=>"bearer", "access_token"=>"AAAAAAAAAAAAAAAAAAAAAApaugAAAAAA%2Bw7iy7XOsIoWUzn7yBpRwFgTAUo%3DSdBBY6luFSpFPSy8RuMg3jfm3JyTMBJGo0Kyc2zhhxKZgMxbAC"}


class Tweet
  def self.access_token
    url = "https://api.twitter.com/oauth2/token"
    enc = Base64.strict_encode64(ENV['twitter_key'] + ":" + ENV['twitter_secret'])
    # enc = Base64.strict_encode64("1532566392-yebjiVWs4s7bhIQETR4zFpqM1gkaeDiLb1gSVY0:88RXSqmv3nxMI4rNelAS0Vy4Fwfx4R6gW9vqtTcaJIbBZ")
    # body = "grant_type=client_credentials"
    response = HTTParty.post(url,
      :headers => {
        "Authorization" => "Basic #{enc}",
        "Content-Type"  => "application/x-www-form-urlencoded;charset=UTF-8",
        "User-Agent" => "My Twitter App"
      },
      :body => {
        "grant_type" => "client_credentials"
      },
      :debug_output => $stdout
    )
    access_token = response['access_token']
    url = "https://api.twitter.com/1.1/statuses/user_timeline.json?count=100&screen_name=twitterapi"
    response = HTTParty.get(url,
      :headers => {
        "Authorization" => "Bearer #{access_token}",
        "User-Agent" => "My Twitter App"
      },
      :debug_output => $stdout
    )
  end
end



# class User
#   url= "https://api.twitter.com/1.1/users/show.json"
#   enc= Base64.strict_encode64(ENV['twitter_key'] + ":" + ENV['twitter_secret'])
#   response = HTTParty.post(url,
#     :headers =>
#     "user_id" =>
#     "screen_name" =>
#     "include_entities" =>

request = Tweet.access_token
puts request




