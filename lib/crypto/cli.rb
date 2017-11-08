class Crypto::CLI

  def self.run
    Crypto::Scraper.scrape_index_page
    binding.pry
    start
  end

  def self.start

    puts "The top ten currenices are:"
    puts "----------------------"
    Crypto::Coin.coins.each_with_index {|coin, i| puts "#{i+1}. #{coin.name}"}
    puts "Based on ranking, which coin do you want more information on?"
    puts "----------------------"
    input = gets.strip.to_i
      if input > 10
        puts "not a valid response, please pick a number between 1-10"
          self.start
        end
    coin = Crypto::Coin.coins[input-1]
    puts "----------------------"
    puts "#{coin.name.upcase}"
    puts "----------------------"
    puts "Symbol: #{coin.symbol}"
    sleep 1
    puts "Price: #{coin.price}"
    sleep 1
    puts "Volume: #{coin.volume}"
    sleep 1
    puts "----------------------"
    puts "Do you want to look up another coin? (y/n)"
    puts "----------------------"
    input = gets.strip.downcase
    puts "----------------------"
    if input == "y"
      self.start
    elsif input == "n"
      puts "Crypto is unstable, check back in a minute!"
    else
      puts "not a valid response, please enter y or n"
      input = gets.strip.downcase
        if input == "y"
          self.start
        else
          puts "quitting program"
        end
    end
  end

end
