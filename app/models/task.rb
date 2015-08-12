class Task < ActiveRecord::Base
  belongs_to :list
  has_many  :task_tags
  has_many  :tags, through: :task_tags
  validates :title, presence: true
  validates :start_date, presence: true
  validate :start_date_cannot_be_in_the_past,
           :due_date_cannot_be_in_the_past

  def start_date_cannot_be_in_the_past
    errors.add(:start_date, "can't be in the past") if
      !start_date.blank? && start_date < Date.today
  end

  def due_date_cannot_be_in_the_past
    errors.add(:due_date, "can't be in the past") if
      !due_date.blank? && due_date < Date.today
  end

end
