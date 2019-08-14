class TranslationController < ApplicationController
  def translatelink
    require 'openssl'
    require 'open-uri'
    @ourUrl = params[:data_value]
    doc = Nokogiri::HTML(open(@ourUrl, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))

    entries = doc.css('.lagos-market-rates-inner')
    rate = entries.css('table')[0].css('tr')[1].css('td')[1].text
    @formattedrate = rate[6..8]
    render template: 'parallel/home'
  end
end
