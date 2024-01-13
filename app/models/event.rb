class Event < ApplicationRecord
  belongs_to :user

  validates :name, :description, :date, :time, :location, presence: true

end
