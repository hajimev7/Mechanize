class TopController < ApplicationController
  def home
    agent = Mechanize.new
    page = agent.get("https://freesworder.net")
    @elements = page.search('.entry-title')   
    @elements =  page.search('a img')
   
  end
end