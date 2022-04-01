class Timecard < ApplicationRecord
  belongs_to :user
  default_scope -> { order(work_begin: :desc) }
  validates :user_id, presence: true
end
