class Crypto::Coin

  attr_accessor :name, :symbol, :price, :crypto_currency, :volume
  @@all = []

  def self.coins
    coins = Crypto::Scraper.scrape_index_page
  end

  def initialize(name = nil, symbol = nil, price = nil, volume = nil)
    @name = name
    @symbol = symbol
    @price = price
    @volume = volume
    @@all << self
  end

  def self.new_from_scraper
    self.coins.each do |coin|
      coin = Crypto::Coin.new(coin[:name], coin[:symbol], coin[:price], coin[:volume])
    end
  end

end
