require 'open-uri'

class PricingPolicy
  attr_reader :base_price

  def initialize(base_price)
    @base_price = base_price
  end

  def fetch_text(url)
    doc = Nokogiri.HTML(open(url))
    doc.css('script').remove
    doc.css('style').remove
    doc.at('body').inner_text
  end
end

class Flexible < PricingPolicy
  def total_price
    text = fetch_text('http://reuters.com')
    margin = text.count('a') / 100.0
    @base_price * margin
  end
end

class Fixed < PricingPolicy
  def total_price
    text = fetch_text('https://developer.github.com/v3/#http-redirects')
    margin = text.scan(/\w+/).count('status')
    @base_price + margin
  end
end

class Prestige < PricingPolicy
  def total_price
    xml = Nokogiri::XML(open('http://www.yourlocalguardian.co.uk/sport/rugby/rss/'))
    margin = xml.xpath('//pubDate').count
    @base_price + margin
  end
end
