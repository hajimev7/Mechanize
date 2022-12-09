class IndexController < ApplicationController
    driver = Selenium::WebDriver.for :chrome
    driver.manage.timeouts.implicit_wait = 5
    driver.navigate.to "http://zozo.jp/"
    sleep 1
    #いらない画像を拾いたくないのでxpathで指定する
    elements = driver.find_elements(:xpath, '//ul/li/div/p/a/img') 
    elements.each_with_index do |e, index|
        # スクレイピング対策なのか、スクロールして初めて画像がblank.gifから正規のURLに変わるっぽい
        # ので、そこまでスクロール
        driver.execute_script('scroll(0,' + e.location.y.to_s + ')')
        puts e.attribute("src") #商品画像URL
    end
    driver.close
end
