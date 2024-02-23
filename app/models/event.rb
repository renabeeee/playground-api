class Event < ApplicationRecord
  belongs_to :user
  has_many :attendances


  validates :name, :description, :date, :time, :location, presence: true

end
