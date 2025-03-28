require "httparty"
require "feedjira"
require "sinatra"
require "kramdown"

def fetch_url_data(url)
  puts "Fetching #{url}..."
  begin
    response = HTTParty.get(url)
    if response.code != 200
      raise "Failed to fetch data. HTTP Status Code: #{response.code}"
    end

    xml = response.body.force_encoding('UTF-8')
    feed = Feedjira.parse(xml)
  rescue StandardError => e
    puts "Error: #{e.message}"
    nil
  end
end

get "/" do
  erb :index
end

get "/about" do
  markdown_content = File.read("about.md")
  erb Kramdown::Document.new(markdown_content).to_html
end

post "/submit" do
  @url = params[:feed_url]
  @feed = fetch_url_data(@url)
  erb :submission
end
