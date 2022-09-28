require_relative '../services/icalendar_service'

class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]

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
    @calendar = Calendar.find(event_params['calendar_id'])
    @event = Event.new(event_params)
    respond_to do |format|
      if @event.save
        format.html { redirect_to "/calendars/#{@calendar.id}", notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        update_ics
        format.html { redirect_to "/calendars/#{event_params['calendar_id']}", notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy
    redirect_to '/calendars'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:title, :description, :start_date, :end_date, :location, :calendar_id)
  end

  def update_ics
    events = Event.where(calendar_id: params[:id])
    @cal = Icalendar::IcalendarService.new
    @ical_ics = @cal.generate_ical(events)
    File.write("public/ics/#{params[:id]}.ics", @ical_ics)
  end
end
