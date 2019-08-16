class StaticPagesController < ApplicationController
  require 'openssl'
  require 'open-uri'
  require 'restclient'




  def home
  end

  def flash

    @ourUrl = params[:data_value]
    doc = Nokogiri::HTML(RestClient.get(@ourUrl))
    arr = []
    frarr = []
    harr = []
    entries = doc.css('#examples-content')
    @entries = entries.css('.src').css('.text')
    @frentries = entries.css('.trg')
    @entries.to_a.take(10).each do |a|
     arr << a.text


     # arr << a.css('span').css('em').text
   end
   @frentries.take(20).each_slice(2) do |f, b|
     frarr << f.css('.text').text
     harr << f.css('.text').css('a').text

    # arr << a.css('span').css('em').text
   end



    @english = entries.css('.text')[0]
    @french = entries.css('.text')[1]
    @arr = arr
    @frarr = frarr
    @harr = harr


    # render template: 'static_pages/flash'
 end



end
