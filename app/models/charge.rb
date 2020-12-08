class Charge < ApplicationRecord
  validates_presence_of :amount

  belongs_to :project, optional: true
  belongs_to :client
  has_many :payments, dependent: :destroy
end
