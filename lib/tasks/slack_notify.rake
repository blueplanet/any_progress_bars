namespace :batch do
  desc 'Send slack notify'
  task :send_slack_notify do 
    ProgressBar.notify_for(Time.current).map(&:send_slack_notify)
  end
end
