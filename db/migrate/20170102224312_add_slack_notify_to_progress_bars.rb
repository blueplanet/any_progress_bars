class AddSlackNotifyToProgressBars < ActiveRecord::Migration[5.0]
  def change
    add_column :progress_bars, :notify_time, :time
    add_column :progress_bars, :slack_url, :string
  end
end
