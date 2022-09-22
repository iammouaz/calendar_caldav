require_relative '../services/caldav_service'
require 'date'

class PagesController < ApplicationController
  def home
    @events = Event.all
  end
end
