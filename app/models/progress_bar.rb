class ProgressBar < ApplicationRecord
  belongs_to :user

  def current_text
    (current * 100 / total).to_i
  end
end
