class Crypto::Scraper

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
