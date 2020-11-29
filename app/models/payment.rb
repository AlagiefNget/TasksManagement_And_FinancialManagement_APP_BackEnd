class Payment < ApplicationRecord
  validates_presence_of :amount, :payment_date
  
  belongs_to :charge
end
