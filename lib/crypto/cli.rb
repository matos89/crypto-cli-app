class Crypto::CLI

  def self.start
    coins = Crypto::Scraper.scrape_index_page

    puts "The top ten currenices are:"
    puts "----------------------"
    Crypto::Coin.coins.each_with_index {|coin, i| puts "#{i+1}. #{coin[:name]}"}
    puts "Based on ranking, which coin do you want more information on?"
    puts "----------------------"
    input = gets.strip.to_i
    puts "----------------------"
    puts "#{coins[input-1][:name].upcase}"
    puts "----------------------"
    puts "Symbol: #{coins[input-1][:symbol]}"
    puts "Price: #{coins[input-1][:price]}"
    puts "Volume: #{coins[input-1][:volume]}"
    puts "----------------------"
  end

end
