class StaticPagesController < ApplicationController
  include ActionView::Helpers::TextHelper

  def home
  end

  def contact
    unless params.blank? 
      c = ContactForm.new(:name => params["name"],:email => params["email"], :message => params["message"])
      if c.deliver
        account_sid = ENV['TWILIO_ACCOUNT_SID']
        auth_token  = ENV['TWILIO_AUTH_TOKEN']
        client = Twilio::REST::Client.new account_sid, auth_token

        from = '+16096442390'

        numbers = {
          '+5218113129230' => "Uno",
          '+5218113129230' => "Dos"
        }

        numbers.each do |key,value|
          client.account.messages.create({
            :from => from, 
            :to => key, 
            :body => "El buen plato => #{value}"
          })
          sleep 15
        end

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
