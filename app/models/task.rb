class Task < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :due_date, presence: true

  enum status: { pending: 0, completed: 1 }

  def due_date_with_wday
    wdays = %w[日 月 火 水 木 金 土]
    "#{due_date} (#{wdays[due_date.wday]})"
  end

end
