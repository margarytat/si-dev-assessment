class PagesController < ApplicationController
  def home
  end

  def sms
    @phone = params[:phone]
    @msg = params[:msg]
    
    puts "\n== Preparing to send message =="
    
    @toPhone = "+1"+@phone
    
    @account_sid = ENV["ACCOUNT_SID"]
    @auth_token = ENV["AUTH_TOKEN"]
    @fromPhone = ENV["FROM_PHONE"]


    @client = Twilio::REST::Client.new @account_sid, @auth_token
    message = @client.messages.create(
        body: @msg,
        to: @toPhone,    
        from: @fromPhone)  

    puts message.sid    

  end
end
