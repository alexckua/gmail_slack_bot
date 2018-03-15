require 'json'
require 'slack'
require 'rubygems'
require_relative 'environment'

module Bot
  class SlackApi
    def initialize
      Slack.configure.token = ENV['SLACK_API_TOKEN']

      @slack_client = Slack::Web::Client.new
    end

    def post_message(message)
      @slack_client.chat_postMessage(channel: 'general', text: message)
    end
  end
end
