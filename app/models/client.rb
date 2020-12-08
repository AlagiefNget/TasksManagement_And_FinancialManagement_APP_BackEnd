class Client < ApplicationRecord
  validates_presence_of :name, :phone_number

  belongs_to :user
  has_many :projects, dependent: :destroy
  has_many :charges


end
