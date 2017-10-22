
require_relative '../../config/environment'

class Scraper

  def self.scrape_index_page
    doc = Nokogiri::HTML(open("https://coinmarketcap.com/"))
    doc.css("tbody tr")[0..9].map.with_index do |crypto, i|
      cryptos = {}
      cryptos[:name] = crypto.css("td.no-wrap.currency-name a")[1].text
      cryptos[:symbol] = crypto.css("td.no-wrap.currency-name a")[0].text
      cryptos[:price] = crypto.css("td.no-wrap.text-right a")[0].text
      cryptos
    end
  end

end

class Coin

  attr_accessor :name, :symbol, :price, :crypto_currency
  @@all = []

  def self.coins
    coins = Scraper.scrape_index_page
  end

  def initialize(name = nil, symbol = nil, price = nil)
    @name = name
    @symbol = symbol
    @price = price
    @@all << self
  end

  def self.new_from_scraper
    self.coins.each do |coin|
      coin = Coin.new(coin[:name], coin[:symbol], coin[:price])
      binding.pry
    end
  end
end

def start
  "The top currencies right now:"
  Coin.coins.each_with_index {|coin, i| puts "#{i+1}. #{coin[:name]}"}
    binding.pry
end

start
