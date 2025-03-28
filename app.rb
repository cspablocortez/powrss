require "httparty"
require "feedjira"
require "sinatra"
require "slim"

def fetch_url_data(url)
  puts "Fetching #{url}..."
  xml = HTTParty.get(url).body
  feed = Feedjira.parse(xml)
end

get "/" do
  erb :index
end

post "/submit" do
  @url = params[:feed_url]
  @feed = fetch_url_data(@url)
  erb :submission
end
