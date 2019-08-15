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
    entries = doc.css('#examples-content')
    @entries = entries.css('.src')
    @entries.to_a.take(10).each_slice(2) do |a, b|
     arr << a.css('span').css('em').text
     # arr << b.css('span').text
   end



    @english = entries.css('.text')[0]
    @french = entries.css('.text')[1]
    @arr = arr


    # render template: 'static_pages/flash'
 end



end
