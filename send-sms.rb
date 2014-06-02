require 'rubygems'
require 'twilio-ruby'

begin
account_sid = "AC6fc4288a79f6c29dffbb7b063091c146"
auth_token = "2b9f57de02af2fb8f20765b2592826a6"
client = Twilio::REST::Client.new account_sid, auth_token

from = "+16096442390" # Your Twilio number

friends = {
  "+5218113129230" => "Curious George",
  "+5218111929631" => "Curious George",
  "+5218110114617" => "Boots"
}
friends.each do |key, value|
  client.account.messages.create(
    :from => from,
    :to => key,
    :body => "Hey #{value}, Monkey party at 6PM. Bring Bananas!"
  ) 
  puts "Sent message to #{value}"
end
rescue Twilio::REST::RequestError => e
  puts e.message
end


