class StaticPagesController < ApplicationController



  def home
  end

  def flash
    @ourUrl = params[:data_value]
  end




end
