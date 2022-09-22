require './config/constants'
require_relative '../services/caldav_service'

class Event < ApplicationRecord
  def self.all
    @cal = Services::CaldavService.new(Instances::URI['user'], Instances::URI['password'])

    @cal.find(start: "#{Time.now.year}-01-01", end: "#{Time.now.year + 1}-01-01")
  end

  def self.create(event_params)
    @cal = Services::CaldavService.new(Instances::URI['user'], Instances::URI['password'])
  
    @cal.create(event_params)
  end

  def self.update(event_params)
    @cal = Services::CaldavService.new(Instances::URI['user'], Instances::URI['password'])

    @cal.update(event_params)
  end

  def self.delete(id)
    @cal = Services::CaldavService.new(Instances::URI['user'], Instances::URI['password'])

    @cal.delete(id)
  end
end
