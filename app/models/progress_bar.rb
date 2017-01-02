class ProgressBar < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: { maximum: 100 }
  validates :total, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :current, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def current_text
    (current * 100 / total).to_i
  end
end
