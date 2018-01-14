require('icalendar')
require('pry')
class RegistrationsController < ApplicationController
  before_action :set_registration, only: [:show, :edit, :update, :destroy]

  # GET /registrations
  # GET /registrations.json
  def index
    @registrations = Registration.all
  end

  # GET /registrations/1
  # GET /registrations/1.json
  def show
  end

  # GET /registrations/new
  def new
    @registration = Registration.new
  end

  # GET /registrations/1/edit
  def edit
  end

  # POST /registrations
  # POST /registrations.json
  def create
    @registration = Registration.new(registration_params)

    cal_file = params[:registration][:file_upload].open

    # Parser returns an array of calendars because a single file can have multiple calendars.
    cals = Icalendar::Calendar.parse(cal_file)
    cal = cals.first

    unique_course = cal.events.first.summary
    current_course = cal.events.first.summary

    # all = [] # for debugging
    user = User.find_by_user_name(params[:registration][:user_name])
    if user == nil # if user not in database
      user = User.create(full_name: params[:registration][:full_name], user_name: params[:registration][:user_name])
    end
    
    (0..cal.events.length-1).step(1).each do |index|
      # todo determine user_id
      # binding.pry
      if current_course != unique_course
        # create database entry
        course = Course.find_by_name(cal.events[index].summary)
        if course == nil
          new_course_id = Course.create(name: cal.events[index].summary, location: cal.events[index].location)
          
        else
          new_course_id = course.id
        end
      end
      # Event.create(user_id: user.id, course_id: new_course_id, start: cal.events[index].dtstart, end: cal.events[index].dtend)
      # set new course
      unique_course = cal.events[index].summary
      current_course = cal.events[index].summary
    end

    Event.create(user_id: user.id, course_id: 1, start: Time.now.to_i+10, end: Time.now.to_i+15)
    Event.create(user_id: user.id, course_id: 2, start: Time.now.to_i+20, end: Time.now.to_i+30)

    respond_to do |format|
      if @registration.save
        format.html { redirect_to @registration, notice: 'Registration was successfully created.' }
        format.json { render :show, status: :created, location: @registration }
      else
        format.html { render :new }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /registrations/1
  # PATCH/PUT /registrations/1.json
  def update
    respond_to do |format|
      if @registration.update(registration_params)
        format.html { redirect_to @registration, notice: 'Registration was successfully updated.' }
        format.json { render :show, status: :ok, location: @registration }
      else
        format.html { render :edit }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registrations/1
  # DELETE /registrations/1.json
  def destroy
    @registration.destroy
    respond_to do |format|
      format.html { redirect_to registrations_url, notice: 'Registration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registration
      @registration = Registration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def registration_params
      params.require(:registration).permit(:user_name, :full_name, :file_upload)
    end
end
