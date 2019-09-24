class StaticPagesController < ApplicationController
  require 'openssl'
  require 'open-uri'
  require 'restclient'
  helper_method :current_user


  def home
    @lang = Language.all
  end
  def about
  end
  def reference
    if current_user
      @using = current_user.email
    else
      @using = "Log in  |  Sign up"
    end
  end

  def history
    @ref = current_user.references
    @num = current_user.references.count
    @divnum = (current_user.references.count / 25.0).to_f.ceil

  end
  def favorite
    @favorites = current_user.favorites
  end

  def flash
    ourUrl = params[:data_value]
    searchText = params[:searchText]
    # "https://context.reverso.net/translation/french-english/j%27arrive"
    # "https://context.reverso.net/translation/english-spanish/house+is+not+home"
    # use this inside restclient.get()   URI.escape(@ourUrl))
    # "https://context.reverso.net/translation/english-spanish/house+is+not+home"
    #
    doc = Nokogiri::HTML(RestClient.get(URI.escape(ourUrl)))
    arr = []
    frarr = []
    harr = []
    entries = doc.css('#examples-content')
    @entries = entries.css('.src').css('.text')
    @frentries = entries.css('.trg')
    # if current_user
    #   current_user.references.create(name: searchText)
    #   @reference = Reference.where(name: searchText)
    #   @definitions.each do |d|
    #      @reference.definition.create(name: d)
    #   end
    # end
      #its easy to save the definitions just get it from nokogiri  and save it here in the controller  no need to touch the template

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
    @harr = harr.uniq
    @reference = current_user.references.create(name: searchText)
    @harr.each do |a|
      @reference.definitions.create(name: a)
    end





  # render template: 'static_pages/flash'
 end
def flashfavorite
  name = params[:name]
  translate = params[:translate]
  current_user.favorites.create(name: name, translation: translate)
end
def delfavorite
  rawname = params[:name]
  name = URI.escape(rawname)
  favorite = Favorite.where(name: name)
  favorite.destroy
end
def translate
   @info = params[:text]
   outLang = params[:lang]
  # @info = "Could be true"
  # outLang = "French"
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
   def sign
   end

end
