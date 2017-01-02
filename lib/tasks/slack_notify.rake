namespace :batch do
  desc 'Send slack notif='
  task :send_slack_notify do 
    ProgressBar.where.not(slack_url: nil).where(notify_time: Time.current.to_s(:time)).each do |progress_bar|
      notifier = Slack::Notifier.new(progress_bar.slack_url)
      message = "今日のタスクをやりましたか？ #{progress_bar_url(progress_bar)}"
      notifier.ping message
    end
  end
end
