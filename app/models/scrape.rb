require 'mechanize'

class Scrape < ApplicationRecord
    def self.fuga_urls
        links = []
        agent = Mechanize.new
        current_page = agent.get("https://xxxxxxxx")
        elements = current_page.search('.ranking-list .item a')
        elements.each do |ele|
          links << ele.get_attribute('href')
        end
        
        links.each do |link|
          get_scraping('https://xxxxxxxx/' + link)
        end
      end
      
      def self.get_scraping(link)
        agent = agent = Mechanize.new
        page = agent.get(link)
        
        title = page.at('.arti-header .head').inner_text
        image_url = page.at('.figure-area img')[:src] if page.at('.figure-area img')
        detail = page.at('.arti-body').inner_text
        
        scraping = Scraping.new(title: title, image_url: image_url, detail: detail)
        scraping.save
      end
end
