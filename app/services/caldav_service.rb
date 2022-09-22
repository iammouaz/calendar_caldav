require 'twisted-caldav'
require 'ostruct'
require './config/constants'

module Services
  class CaldavService
    attr_accessor :name, :password

    def initialize(name, password)
      @cal = TwistedCaldav::Client.new(uri: "#{Instances::URI['base']
                                             }calendars/users/#{name}/calendar/", user: name,
                                       password: password)
    end

    def create(event_params)
      @cal.create_event(event_params)
    end

    def find(params)
      response = @cal.find_events(params)
      if response
        response.map { |event| OpenStruct.new(event.properties) }

      else
        response end
    end

    def update(event_params)
      @cal.update_event(event_params)
    end

    def delete(uid)
      @cal.delete_event(uid)
    end
  end
end
