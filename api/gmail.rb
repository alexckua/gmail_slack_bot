require 'gmail'
require 'json'
require_relative '../config/environment'

module Bot
  class GmailApi
    def initialize
      username = ENV['GMAIL_USER_NAME']
      password = ENV['GMAIL_PASSWORD']

      @gmail_client = Gmail.connect(username, password)
    end

    def get_email
      @gmail_client.inbox.find(:unread)
    end

    def get_message(email)
      email.subject
      email.text_part.body
    end

    def read_email(email)
      email.read!
    end
  end
end
