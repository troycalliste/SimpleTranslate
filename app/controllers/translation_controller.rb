class TranslationController < ApplicationController
  require 'restclient'
  def translatelink
    # require 'openssl'
    # require 'open-uri'
    # @ourUrl = params[:data_value]
    # doc = Nokogiri::HTML(open(@ourUrl, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))
    #
    # entries = doc.css('#examples-content')
    # rate = entries.css('.text')[0].text
    #
    # @formattedrate = rate
    # render template: 'static_pages/flash'
  end
  def paste
    if current_user
      @using =  current_user.email
    end
  end
  def flash
     @enfrlink = params[:data_value]
     @otherarr = params[:arr2]
    # @enfrlink = ["okay", "next", 1]
      @arr = []
      @farr = []
      # "https://www.collinsdictionary.com/dictionary/english-french/a-bargain-buy"

      @readylink = ["https://www.collinsdictionary.com/dictionary/english-french/a-foregone-conclusion", "https://www.collinsdictionary.com/dictionary/english-french/a-fortiori", "https://www.collinsdictionary.com/dictionary/english-french/a-free-hand", "https://www.collinsdictionary.com/dictionary/english-french/a-free-lunch", "https://www.collinsdictionary.com/dictionary/english-french/a-free-ride", "https://www.collinsdictionary.com/dictionary/english-french/a-frog-in-one's-throat", "https://www.collinsdictionary.com/dictionary/english-french/a-full-plate", "https://www.collinsdictionary.com/dictionary/english-french/a-full-court-press", "https://www.collinsdictionary.com/dictionary/english-french/a-full-time-job", "https://www.collinsdictionary.com/dictionary/english-french/A-game", "https://www.collinsdictionary.com/dictionary/english-french/a-game-plan", "https://www.collinsdictionary.com/dictionary/english-french/(a-game)-not-worth-the-candle", "https://www.collinsdictionary.com/dictionary/english-french/a-gentleman's-agreement", "https://www.collinsdictionary.com/dictionary/english-french/a-ghost-of-a-chance", "https://www.collinsdictionary.com/dictionary/english-french/a-gleam-in-someone's-eye", "https://www.collinsdictionary.com/dictionary/english-french/a-glutton-for-punishment", "https://www.collinsdictionary.com/dictionary/english-french/à-go-go", "https://www.collinsdictionary.com/dictionary/english-french/à-gogo", "https://www.collinsdictionary.com/dictionary/english-french/a-good-bet", "https://www.collinsdictionary.com/dictionary/english-french/a-good-bet/a-safe-bet", "https://www.collinsdictionary.com/dictionary/english-french/a-good-few", "https://www.collinsdictionary.com/dictionary/english-french/a-good-laugh", "https://www.collinsdictionary.com/dictionary/english-french/a-good-laugh/a-bit-of-a-laugh", "https://www.collinsdictionary.com/dictionary/english-french/a-good-many", "https://www.collinsdictionary.com/dictionary/english-french/a-good-many/a-great-many"]


    @enfrlink.each_with_index do |a, index|
    # "https://context.reverso.net/translation/french-english/j%27arrive"
    # use this inside restclient.get()   URI.escape(@ourUrl))
    begin
      response = RestClient.get URI.escape(a)

         doc = Nokogiri::HTML(RestClient.get URI.escape(a))

        @origWord = doc.css('.h2_entry').css('.orth')[0].text
        @origDef = doc.css('.type-translation').css('.quote')
        if @origDef[0].text && @origWord
           @arr << @origWord + " - " #+ index.to_s
           @farr << @origDef[0].text #+ index.to_s
        end
     rescue => e
            # if not @originWord
        if @otherarr
           @arr << "(translation of \"#{@otherarr[index] }\" is not available)" #+ index.to_s
        end

            # else
           @farr << ""
            # end

     end

     # @origWord = doc.css('.h2_entry').css('.orth').text
     # @origDef = doc.css('.type-translation').css('.quote')
      # if not @origWord.empty?
      end
   end




   def flashcards
     project_id = ENV["CLOUD_PROJECT_ID"]

     # Instantiates a client
    translate = Google::Cloud::Translate.new project: project_id

  # The text to translate
    text = "Hello, world!"
   # The target language
    target = "ru"

  # Translates some text into Russian
    translation = translate.translate text, to: target
    @txt = translation
   end
   def trnslate



   end

  end
