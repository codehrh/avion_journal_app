class Task < ApplicationRecord
    belongs_to :category

    validates :task_name, presence: true
    validates :details, presence: true
    validates :due_date, presence: true
end
