class Crypto::Coin

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

end
