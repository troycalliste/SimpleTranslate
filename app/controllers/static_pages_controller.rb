class StaticPagesController < ApplicationController
  require 'openssl'
  require 'open-uri'
  require 'restclient'




  def home
  end

  def flash

    @ourUrl = params[:data_value]
    # "https://context.reverso.net/translation/french-english/j%27arrive"
    # use this inside restclient.get()   URI.escape(@ourUrl))
    doc = Nokogiri::HTML(RestClient.get(URI.escape(@ourUrl)))
    arr = []
    frarr = []
    harr = []
    entries = doc.css('#examples-content')
    @entries = entries.css('.src').css('.text')
    @frentries = entries.css('.trg')
    @entries.to_a.take(10).each do |a|
     arr << a.to_html


     # arr << a.css('span').css('em').text
   end
   @frentries.take(20).each_slice(2) do |f, b|
     y = f.css('.text').to_html
     frarr << y
    harr << f.css('.text').css('a')[0].text

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
