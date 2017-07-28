class PagesController < ApplicationController
  def home
  end

  def sms
    @phone = params[:phone]
    @msg = params[:msg]
    
    puts "\n== Preparing to send message =="
    
    @toPhone = @phone
    
    @account_sid = ENV["ACCOUNT_SID"]
    @auth_token = ENV["AUTH_TOKEN"]
    @fromPhone = ENV["FROM_PHONE"]
    
    if !Phonelib.valid?(@phone)
      @phone = "+1"+@phone
    end

    @client = Twilio::REST::Client.new @account_sid, @auth_token
    if Phonelib.valid?(@phone)
      begin
        message = @client.messages.create(
            body: @msg,
            to: @toPhone,    
            from: @fromPhone)  
        @sms_result = "Your message was sent."
        puts message.sid  
      rescue Twilio::REST::RestError => error
        @sms_result = "You failed as a Twilio user. The message was not sent."
      end
    else
      @sms_result = "You failed as a human being. The entered phone number is invalid."
    end

  end
end
