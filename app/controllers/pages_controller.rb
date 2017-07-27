class PagesController < ApplicationController
  def home
  end

  def sms
    @phone = params[:phone]
    @msg = params[:msg]
    
    puts "\n== Preparing to send message =="
    
    account_sid = "AC4e6e514986bf159f11205fdb5bd5f7f5" 
    auth_token = "c27b07542926561dd847e63c64a962ab" 
    
    @fromPhone = "+16176185611"
    @toPhone = "+1"+@phone

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
        body: @msg,
        to: @toPhone,    
        from: @fromPhone)  

    puts message.sid    

  end
end
