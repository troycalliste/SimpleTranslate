class StaticPagesController < ApplicationController
  require 'openssl'
  require 'open-uri'
  require 'restclient'




  def home
    @lang = Language.all
  end

  def flash

    @ourUrl = params[:data_value]
    # "https://context.reverso.net/translation/french-english/j%27arrive"
    # "https://context.reverso.net/translation/english-spanish/house+is+not+home"
    # use this inside restclient.get()   URI.escape(@ourUrl))
    "https://context.reverso.net/translation/english-spanish/house+is+not+home"
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
     begin
     y = f.css('.text').to_html
     frarr << y
     harr << f.css('.text').css('a')[0].text
   rescue => e
     # harr << "(word not available)"
   end
     # arr << a.css('span').css('em').text
   end



    @english = entries.css('.text')[0]
    @french = entries.css('.text')[1]
    @arr = arr
    @frarr = frarr
    @harr = harr




    # render template: 'static_pages/flash'
 end

def translate
   @info = params[:text]
  outLang = params[:lang]
  # @info = "you know you're right"
  # outLang = "Czech"
  project_id = ENV["CLOUD_PROJECT_ID"]

  # Instantiates a client
 translate = Google::Cloud::Translate.new project: project_id

# The text to translate
  @currentLang = Language.find_by(name: outLang)
  text = @info
# The target language
  target = @currentLang.code
   @speak = @currentLang.speak
  detection = translate.detect text
  lang = detection.language
  @detectedLang = Language.find_by(code: lang)




# Translates some text into Russian
 translation = translate.translate text, to: target
 @txt = translation
end

end
