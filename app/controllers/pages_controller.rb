class PagesController < ApplicationController
  def home
  end

  def sms
    @phone = params[:phone]
    @msg = params[:msg]

  end
end
