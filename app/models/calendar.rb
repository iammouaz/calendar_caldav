class Calendar < ApplicationRecord
  validates :name, :password, presence: true
end
