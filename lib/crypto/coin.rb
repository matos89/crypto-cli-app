class Crypto::Coin

  attr_accessor :name, :symbol, :price, :crypto_currency, :volume
  @@all = []

  def self.coins
    @@all
  end

  def initialize(name = nil, symbol = nil, price = nil, volume = nil)
    @name = name
    @symbol = symbol
    @price = price
    @volume = volume
    @@all << self
  end

  def self.price_above(number)
    self.coins.select { |coin| coin.price.delete("$").to_f > number.to_i }
  end
end
