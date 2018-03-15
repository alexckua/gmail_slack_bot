require 'gmail'
require 'json'
require './environment'

class Emails
  def auth
    username = ENV['gmail_user_name']
    password = ENV['gmail_password']

    Gmail.connect(username, password)
  end

  def get_mails
    emails = auth.inbox.find(:from => "pullrequests-reply@bitbucket.org")
    show_mails(emails) unless emails.empty?
  end

  def show_mails(emails)
    emails.each do |mail|
      p mail.subject
      p mail.text_part.body
    end
  end
end
