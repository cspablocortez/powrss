require "httparty"
require "feedjira"
require "sinatra"
require "slim"

# urls = ["https://rss.beehiiv.com/feeds/4aF2pGVAEN.xml"]
# urls = ["https://bucareli.blog/feed.xml", "https://desktopwords.com/feed.xml"]

template = File.read("feed_template.html.erb")

urls.each do |url|
  xml = HTTParty.get(url).body
  feed = Feedjira.parse(xml)

  renderer = ERB.new(template)
  result = renderer.result(binding)

  File.open("#{feed.title.gsub(/[^\w\s]/, '')}.html", "w") do |file|
    file.write(result)
  end

  puts "✅ Generated: #{feed.title}.html"
end




