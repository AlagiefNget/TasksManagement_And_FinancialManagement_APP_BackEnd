class Todo < ApplicationRecord
    validates :task, presence: true
    validates_presence_of :status
    validates_presence_of :date

    belongs_to :user
end
