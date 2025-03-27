require "httparty"
require "feedjira"
require "sinatra"
require "slim"

# urls = ["https://rss.beehiiv.com/feeds/4aF2pGVAEN.xml"]
# urls = ["https://bucareli.blog/feed.xml", "https://desktopwords.com/feed.xml"]

get "/" do
  slim :index
end

post "/submit" do
  @submitted = true
  slim :index
end
