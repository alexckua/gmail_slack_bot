## This app checks emails for the selected address and sends it to the slack channel.

### Install
1. Clone `https://github.com/alexckua/gmail_slack_bot.git`
2. `bundle install`
3. Set up slack app && get slack api token
4. Add gmail username/password and slack token to `config/environment.rb`
5. Change find emails params in `api/gmail.rb`
6. Set up paths in `start.sh` && `schedule.rb`
7. Add task to cron `whenever --update-crontab`
