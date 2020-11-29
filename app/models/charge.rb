class Charge < ApplicationRecord
  validates_presence_of :amount

  belongs_to :project
  has_many :payments
end
