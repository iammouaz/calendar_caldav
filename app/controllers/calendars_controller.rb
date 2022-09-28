require_relative '../services/icalendar_service'

class CalendarsController < ApplicationController
  before_action :set_calendar, only: %i[show edit update destroy]

  # GET /calendars or /calendars.json
  def index
    @calendars = Calendar.all
  end

  # GET /calendars/1 or /calendars/1.json
  def show
    events = Event.where(calendar_id: params[:id])
    @cal = Icalendar::IcalendarService.new
    @ical_ics = @cal.generate_ical(events)
    url = request.original_url
    @str = url[0...-12]
  end

  # GET /calendars/new
  def new
    @calendar = Calendar.new
  end

  # GET /calendars/1/edit
  def edit; end

  # POST /calendars or /calendars.json
  def create
    @calendar = Calendar.new(calendar_params)
    respond_to do |format|
      if @calendar.save
        format.html { redirect_to calendar_url(@calendar), notice: 'Calendar was successfully created.' }
        format.json { render :show, status: :created, location: @calendar }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @calendar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calendars/1 or /calendars/1.json
  def update
    respond_to do |format|
      if @calendar.update(calendar_params)
        format.html { redirect_to calendar_url(@calendar), notice: 'Calendar was successfully updated.' }
        format.json { render :show, status: :ok, location: @calendar }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @calendar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calendars/1 or /calendars/1.json
  def destroy
    @calendar.destroy
    respond_to do |format|
      format.html { redirect_to calendars_url, notice: 'Calendar was successfully destroyed.' }
      format.json { head :no_content }
    end
    delete_ics()
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_calendar
    @calendar = Calendar.find(params[:id])
    @events = Event.where(calendar_id: params[:id])
  end

  # Only allow a list of trusted parameters through.
  def calendar_params
    params.require(:calendar).permit(:name, :password)
  end

  def update_ics(id)
    events = Event.where(calendar_id: id)
    @cal = Icalendar::IcalendarService.new
    @ical_ics = @cal.generate_ical(events)
    File.write("public/ics/#{id}.ics", @ical_ics)
  end

  def delete_ics
    File.delete("public/ics/#{params[:id]}.ics")
  end
end
