class CommunicationsController < ApplicationController
  before_action :set_communication, only: [:show, :edit, :update, :destroy]

  # GET /communications
  # GET /communications.json
  def index
    #@communications = Communication.all
    @subjects = Subject.all
     respond_to do |format|
      format.html
      format.json do
        
        render json: ::CommunicationDatatable.new(view_context)
        
      end
    end
  end

  # GET /communications/1
  # GET /communications/1.json
  def show
  end

  def get_subject_communication
    begin
      @subject = Subject.find(params[:id])
      #@communication = Communication.where(:subject_id=>@subject.id)
      @communication=Communication.joins(:subject).joins(:person).joins(:user).where(:subject_id=>@subject.id)
      .select("communications.id,about,keyword,communications.created_at,communications.updated_at,subjects.name as subject_name, people.first_name,people.last_name,users.email")
        respond_to do |format|
        format.json { render :json => {"status":"ok", "data":@communication.as_json}  }
      end

    rescue=>error
      redirect_to contacts_path, alert: error.message
    end
  end

  # GET /communications/new
  def new
    @communication = Communication.new
  end

  # GET /communications/1/edit
  def edit
  end

  def modal_create_comm
     begin

      subjid= params[:subjid]
      personid= params[:personid]
      commabout= params[:commabout]
      commkeyword= params[:commkeyword]
           
        c=Communication.new(:subject_id=>subjid,:person_id=>personid,:about=>commabout,:keyword=>commkeyword,:user_id=>current_user.id)
        
      if (c.save)
              
          respond_to do |format|
              format.json { render :json => {"status":"ok"}  }
           end
        else
          respond_to do |format|
              format.json { render :json => {"status":"nepodarilo sa vložiť záznam"}  }
           end
         end


       
    rescue => error
      redirect_to communications_path, alert: error.message
    end
  end

   def modal_update_comm
     begin

      commid = params[:commid]

      c = Communication.find(commid)
      c.subject_id = params[:editsubjid]
      c.person_id= params[:editpersonid]
      c.about= params[:editcommabout]
      c.keyword= params[:editcommkeyword]
           
                
      if (c.save)
              
          respond_to do |format|
              format.json { render :json => {"status":"ok"}  }
           end
        else
          respond_to do |format|
              format.json { render :json => {"status":"nepodarilo sa upraviť záznam"}  }
           end
         end


       
    rescue => error
      redirect_to communications_path, alert: error.message
    end
  end

  # POST /communications
  # POST /communications.json
  def create
    @communication = Communication.new(communication_params)

    respond_to do |format|
      if @communication.save
        format.html { redirect_to @communication, notice: 'Záznam komunikácie bol úspešne vytvorený.' }
        format.json { render :show, status: :created, location: @communication }
      else
        format.html { render :new }
        format.json { render json: @communication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /communications/1
  # PATCH/PUT /communications/1.json
  def update
    respond_to do |format|
      if @communication.update(communication_params)
        format.html { redirect_to @communication, notice: 'Záznam komunikácie bol úspešne upravený.' }
        format.json { render :show, status: :ok, location: @communication }
      else
        format.html { render :edit }
        format.json { render json: @communication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /communications/1
  # DELETE /communications/1.json
  def destroy
    @communication.destroy
    respond_to do |format|
      format.html { redirect_to communications_url, notice: 'Záznam komunikácie bol úspešne zmazaný.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_communication
      @communication = Communication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def communication_params
      params.require(:communication).permit(:subject_id, :person_id, :about, :keyword, :user_id)
    end
end
