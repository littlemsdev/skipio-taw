require 'twilio-ruby'

class Notifier

  class << self

    def send_sms(phone_mobile)
      account_sid = Settings.twilio.account_sid
      auth_token  = Settings.twilio.auth_token
      @client = Twilio::REST::Client.new(account_sid, auth_token)

      @client.messages.create from: Settings.twilio.main_number,
                              to: phone_mobile,
                              body: 'Skipio Test Code - Charlene Taw (Applicant for Ruby on Rails)'
    end

    def send_custom_sms(phone_mobile, c_message)
      account_sid = Settings.twilio.account_sid
      auth_token  = Settings.twilio.auth_token
      @client = Twilio::REST::Client.new(account_sid, auth_token)

      @client.messages.create from: Settings.twilio.main_number,
                              to: phone_mobile,
                              body: c_message
    end

  end

end
