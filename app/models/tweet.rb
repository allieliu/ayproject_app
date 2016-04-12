require "httparty"
require "base64"


class Tweet
  def self.access_token
  url = "https://api.twitter.com/oauth2/token"
    enc = Base64.strict_encode64(ENV['twitter_key'] + ":" + ENV['twitter_secret'])
    # enc = Base64.strict_encode64("1532566392-yebjiVWs4s7bhIQETR4zFpqM1gkaeDiLb1gSVY0:88RXSqmv3nxMI4rNelAS0Vy4Fwfx4R6gW9vqtTcaJIbBZ")
    # body = "grant_type=client_credentials"
    HTTParty.post(url,
      :headers => {
        "Token" => "AAAAAAAAAAAAAAAAAAAAAApaugAAAAAA%2Bw7iy7XOsIoWUzn7yBpRwFgTAUo%3DSdBBY6luFSpFPSy8RuMg3jfm3JyTMBJGo0Kyc2zhhxKZgMxbAC",
        "Authorization" => "Basic #{enc}",
        "Content-Type"  => "application/x-www-form-urlencoded;charset=UTF-8",
        "User-Agent" => "My Twitter App"
      },
      :body => {
        "grant_type" => "client_credentials"
      },
      :debug_output => $stdout
    )
  end
end

request = Tweet.access_token
puts request




