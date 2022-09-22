class Event < ApplicationRecord
  belongs_to :calendar
  validates :title, :description, :start, :end, :location, :calendar_id, presence: true


end
