class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy]

  # GET /subjects
  # GET /subjects.json
  def index
    #@subjects = Subject.all
     params["columns"] ||= { "0" => {"data" => "" } }
    params["length"]  ||= -1
    
     respond_to do |format|
      format.html
      format.json do
        #render json: ::ActivityDatatable.new(view_context, {region: get_current_user_region_filter})
        render json: ::SubjectDatatable.new(view_context)
        
      end
    end
  end

  def show_subject_profile
    @subject = Subject.find(params[:id])
    @communications = Communication.where(:subject_id=>@subject.id).order("created_at desc").limit(6)
    @documents = Document.where(:subject_id=>@subject.id)
    @people = Person.where(:subject_id=>@subject.id)
    @media = Medium.where(:subject_id=>@subject.id)

    @districts = District.all.order(:name)
    @subjtypes = Subjtype.all.order(:name)
    @subjects = Subject.all.order(:name)
    @projecttargets = Projecttarget.all.order(:name)
  end

  # GET /subjects/1
  # GET /subjects/1.json
  def show
  end

  # GET /subjects/new
  def new
    @subject = Subject.new
  end

  # GET /subjects/1/edit
  def edit
  end

  def modal_create_subj
     begin

      subjname= params[:subjname]
      subjdistrict= params[:subjdistrict]
      subjtype= params[:subjtype]
      subjsite= params[:subjsite]
      subjico= params[:subjico]
      subjisvip = params[:isvip]
      subjnote= params[:subjnote]
      subjobyv= params[:subjobyv]
      contactname= params[:contactname]
      contactsurname= params[:contactsurname]
      contactemail= params[:contactemail]
      contactphone= params[:contactphone]
      contactcell= params[:contactcell]
      contactnote= params[:contactnote]

      

        s=Subject.new(:name=>subjname,:site=>subjsite,:ico=>subjico,:district_id=>subjdistrict,:subjtype_id=>subjtype,:user_id=>current_user.id,:note=>subjnote, :citizen_count=>subjobyv, :vip=>subjisvip)
        s.save

        p=Person.new(:first_name=>contactname, :last_name=>contactsurname, :email=>contactemail,:phone=>contactphone,:cellphone=>contactcell,:note=>contactnote)

        if s.persisted?
          p.subject_id = s.id
          p.save
        end

        if (s.persisted? && p.persisted?)
              
          respond_to do |format|
              format.json { render :json => {"status":"ok"}  }
           end
        else
          respond_to do |format|
              format.json { render :json => {"status":"nepodarilo sa vložiť záznam"}  }
           end
         end


       
    rescue => error
      redirect_to contacts_path, alert: error.message
    end
  end

  def modal_edit_subj
     begin

      @subject = Subject.find(params[:edit_subjectid])

      @subject.name = params[:edit_subjname]
      @subject.district_id = params[:edit_subjdistrict]
      @subject.subjtype_id = params[:edit_subjtype]
      @subject.site = params[:edit_subjsite]
      @subject.ico = params[:edit_subjico]
      @subject.note= params[:edit_subjnote]
      @subject.vip = params[:edit_isvip]
      @subject.citizen_count = params[:edit_subjobyv]
      if params[:edit_project_targets ] != 0
        @subject.project_targets = params[:edit_project_targets ]

        @targets = Projecttarget.where(:id=>params[:edit_project_targets])
        @subject.project_targets_string = @targets.pluck(:name).join(",")

      end
      

           

      if (@subject.save)
          respond_to do |format|
              format.json { render :json => {"status":"ok"}  }
           end
        else
          respond_to do |format|
              format.json { render :json => {"status":"nepodarilo sa upraviť záznam"}  }
           end
         end


       
    rescue => error
      redirect_to contacts_path, alert: error.message
    end
  end

  # POST /subjects
  # POST /subjects.json
  def create
    @subject = Subject.new(subject_params)

    respond_to do |format|
      if @subject.save
        format.html { redirect_to @subject, notice: 'Subjekt bol úspešne vytvorený.' }
        format.json { render :show, status: :created, location: @subject }
      else
        format.html { render :new }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subjects/1
  # PATCH/PUT /subjects/1.json
  def update
    respond_to do |format|
      if @subject.update(subject_params)
        format.html { redirect_to @subject, notice: 'Subjekt bol úspešne zmenený.' }
        format.json { render :show, status: :ok, location: @subject }
      else
        format.html { render :edit }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1
  # DELETE /subjects/1.json
  def destroy
    @subject.destroy
    respond_to do |format|
      #format.html { redirect_to subjects_url, notice: 'Subjekt bol úspešne zmazaný.' }
      format.html { redirect_to contacts_url, notice: 'Subjekt bol úspešne zmazaný.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subject_params
      params.require(:subject).permit(:name, :site, :ico, :district_id, :subjtype_id, :note, :web, :zaujimavost, :citizen_count)
    end
end
