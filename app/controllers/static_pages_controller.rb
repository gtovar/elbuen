class StaticPagesController < ApplicationController

  def home
  end

  def contact
    unless params.blank? 
        c = ContactForm.new(:name => params["name"],:email => params["email"], :message => params["message"])
        if c.deliver
          account_sid = ENV['TWILIO_ACCOUNT_SID']
          auth_token  = ENV['TWILIO_AUTH_TOKEN']
          @client = Twilio::REST::Client.new account_sid, auth_token
          @client.account.sms.messages.create({
              :from => '+16096442390', 
              :to => '+5218113129230', 
              :body => "El buen plato recibio un email,=> #{params["message"]}"
          })
          redirect_to root_path
        end
    end
  end

  def dishes
  end

  def about
  end

  def events
  end

end
