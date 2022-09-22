require_relative '../services/caldav_service'
require './config/constants'

class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]

  def initialize
    super()
    @cal = Services::CaldavService.new(Instances::URI['user'], Instances::URI['password'])
  end

  # GET /events or /events.json
  def index
    @events = Event.all
  end

  # GET /events/1 or /events/1.json
  def show; end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit; end

  # POST /events or /events.json
  def create
    event = Event.create(event_params)
    respond_to do |format|
      if event
        format.html { redirect_to event_url(event.uid), notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    Event.update(event_params)
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to event_url(@event.uid), notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    Event.delete(params[:id])
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @events = Event.all
    @event = @events.select { |data| data.uid == params[:id] }
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:title, :description, :start, :end, :location)
  end
end
