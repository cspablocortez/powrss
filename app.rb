require "httparty"
require "feedjira"
require "sinatra"

def fetch_url_data(url)
  puts "Fetching #{url}..."
  begin
    response = HTTParty.get(url)
    if response.code != 200
      raise "Failed to fetch data. HTTP Status Code: #{response.code}"
    end

    xml = response.body.encode("UTF-8", invalid: :replace, undef: :replace, replace: "?")
    feed = Feedjira.parse(xml)
  rescue StandardError => e
    puts "Error: #{e.message}"
    nil
  end
end

get "/" do
  erb :index
end

post "/submit" do
  @url = params[:feed_url]
  @feed = fetch_url_data(@url)
  erb :submission
end
