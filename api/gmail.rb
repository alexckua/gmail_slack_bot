require 'gmail'
require 'json'
require_relative 'environment'

module Bot
  class GmailApi
    def initialize
      username = ENV['GMAIL_USER_NAME']
      password = ENV['GMAIL_PASSWORD']

      @gmail_client = Gmail.connect(username, password)
    end

    def get_email
      @gmail_client.inbox.find(:unread, :from => "pullrequests-reply@bitbucket.org")
    end

    def get_message(email)
      email.subject
      email.text_part.body
    end
  end
end
