class Event < ApplicationRecord
  belongs_to :calendar
  validates :title, :description, :start_date, :end_date, :location, :calendar_id, presence: true


end
