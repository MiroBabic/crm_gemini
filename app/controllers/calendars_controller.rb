class CalendarsController < ApplicationController
  before_action :set_calendar, only: [:show, :edit, :update, :destroy]

  # GET /calendars
  # GET /calendars.json
  def index
    @calendars = Calendar.all
  end

  # GET /calendars/1
  # GET /calendars/1.json
  def show
  end

  # GET /calendars/new
  def new
    @calendar = Calendar.new
  end

  # GET /calendars/1/edit
  def edit
  end

  def show_calendar
  end

  def get_calendar_events
    @calendar = Calendar.where("user_id = ? and disabled is not true",current_user.id)

    respond_to do |format|
      format.json { render :json => @calendar.as_json  }
    end
  end

  def get_user_calendar
    @calendar = Calendar.where("user_id = ? and disabled is not true and start >= ?",params[:id], (Date.today - 1) ).order("start desc")

    arr=Array.new
    @calendar.each do |cal|
      @res = Hash.new
      @res["id"] = cal.id
      @res["title"] = cal.title
      @res["orig_start"] = cal.start
      @res["start"] = (I18n.localize cal.start, :format => :long)
      arr.push(@res)
    end
   
    arr = arr.sort_by {|x| x["orig_start"]}
    respond_to do |format|
      format.json { render :json => {"status":"ok", "data":arr.as_json } }
    end

  end

  def add_calendar_event
    begin
      @event = Calendar.new(:title=>params[:title],:url=>params[:url],:start=>params[:start],:end=>params[:end],:all_day=>params[:allDay],:user_id=>current_user.id)
      
      if (@event.save)
        respond_to do |format|
              format.json { render :json => {"status":"ok"}  }
           end
        else
          respond_to do |format|
              format.json { render :json => {"status":"nepodarilo sa vložiť záznam"}  }
           end
         end

    rescue => error
      redirect_to show_calendar_path, alert: error.message
    end
  end

def edit_calendar_event
    begin
      @event = Calendar.find(params[:id])
      @event.title = params[:title] if params[:title].present?
      @event.start = params[:start] if params[:start].present?
      @event.end = params[:end] if params[:end].present?

      if (@event.save)
        respond_to do |format|
              format.json { render :json => {"status":"ok"}  }
           end
        else
          respond_to do |format|
              format.json { render :json => {"status":"nepodarilo sa upraviť záznam"}  }
           end
         end

    rescue => error
      redirect_to show_calendar_path, alert: error.message
    end
  end

  def remove_calendar_event
    begin
      @event = Calendar.find(params[:id])
      @event.disabled = true

      if (@event.save)
        respond_to do |format|
              format.json { render :json => {"status":"ok"}  }
           end
        else
          respond_to do |format|
              format.json { render :json => {"status":"nepodarilo sa vymazať záznam"}  }
           end
         end

    rescue => error
      redirect_to show_calendar_path, alert: error.message
    end
  end

  # POST /calendars
  # POST /calendars.json
  def create
    @calendar = Calendar.new(calendar_params)

    respond_to do |format|
      if @calendar.save
        format.html { redirect_to @calendar, notice: 'Calendar was successfully created.' }
        format.json { render :show, status: :created, location: @calendar }
      else
        format.html { render :new }
        format.json { render json: @calendar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calendars/1
  # PATCH/PUT /calendars/1.json
  def update
    respond_to do |format|
      if @calendar.update(calendar_params)
        format.html { redirect_to @calendar, notice: 'Calendar was successfully updated.' }
        format.json { render :show, status: :ok, location: @calendar }
      else
        format.html { render :edit }
        format.json { render json: @calendar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calendars/1
  # DELETE /calendars/1.json
  def destroy
    @calendar.destroy
    respond_to do |format|
      format.html { redirect_to calendars_url, notice: 'Calendar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calendar
      @calendar = Calendar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def calendar_params
      params.require(:calendar).permit(:title, :start, :end, :url, :user_id, :all_day)
    end
end
