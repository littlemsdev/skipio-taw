module Skipio

  class Contact < Base

    attr_accessor :id, :full_name, :first_name, :last_name, :phone_mobile, :avatar_url, :email

    CACHE_DEFAULTS = { expires_in: 7.days, force: false }

    def initialize(args = {})
      super(args)
    end

    # https://stage.skipio.com/api/v2/contacts?token={{token}}&page={{page}}&per={{per}}

    def self.random(clear_cache)
      cache = CACHE_DEFAULTS.merge({ force: clear_cache })
      response = Request.where("contacts?token=#{Settings.skipio.token}", cache)
      contacts = response.fetch('data', []).map { |contact| Contact.new(contact) }
      [ contacts, response[:errors] ]
    end

    # https://stage.skipio.com/api/v2/contacts/373dfcb8-224c-4253-b4fd-c080569984e1?token=d3ef07cd3fb17859a874b7854c84f0ec

    def self.find(id)
      response = Request.get("contacts/#{id}?token=#{Settings.skipio.token}", CACHE_DEFAULTS)
      contact = response.fetch('data')
      Contact.new(contact)
    end

  end
end
