require 'twilio-ruby'

class Notifier

  def initialize
    account_sid = Settings.twilio.account_sid
    auth_token  = Settings.twilio.auth_token
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send_sms
    @client.messages.create(
      from:      Settings.twilio.main_number,
      to:        "+639354281176",
      body:      "TEST Skipio"
    )
  end

end
