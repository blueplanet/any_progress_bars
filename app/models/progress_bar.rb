class ProgressBar < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: { maximum: 100 }
  validates :total, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :current, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :notify_for, -> (time) {
    time_cond = time.to_s(:time)[0, 4] + '0' # 10分単位に切り捨て
    where.not(slack_url: nil).where(notify_time: time_cond)
  }

  def current_text
    (current * 100 / total).to_i
  end

  def send_slack_notify
    notifier = Slack::Notifier.new(slack_url)
    message = "今日のタスクをやりましたか？ #{Rails.application.routes.url_helpers.progress_bar_url(self)}"
    notifier.ping message
  end
end
