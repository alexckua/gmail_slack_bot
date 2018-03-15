module Bot
  require_relative 'api/gmail'
  require_relative 'api/slack'

  class Messages
    def initialize
      @gmail = Bot::GmailApi.new
      @slack = Bot::SlackApi.new
    end

    def run
      emails = @gmail.get_email
      add_message(emails) unless emails.empty?
    end

    def add_message(emails)
      emails.each do |email|
        message = @gmail.get_message(email)

        @slack.post_message(message)
        @gmail.read_email(email)
      end
    end
  end
end

bot = Bot::Messages.new
bot.run
