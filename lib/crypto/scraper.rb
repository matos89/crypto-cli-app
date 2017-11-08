class Crypto::Scraper

  def self.scrape_index_page
    doc = Nokogiri::HTML(open("https://coinmarketcap.com/"))
    doc.css("tbody tr")[0..9].map do |crypto|

      name = crypto.css("td.no-wrap.currency-name a")[1].text
      symbol = crypto.css("td.no-wrap.currency-name a")[0].text
      price = crypto.css("td.no-wrap.text-right a")[0].text
      volume = crypto.css("td.no-wrap.text-right a")[1].text
      Crypto::Coin.new(name, symbol, price, volume)
    end
  end

end
