class ImplementationsController < ApplicationController
  before_action :set_implementation, only: [:show, :edit, :update, :destroy]

  # GET /implementations
  # GET /implementations.json
  def index
    params["columns"] ||= { "0" => {"data" => "" } }
    params["length"]  ||= -1

    @users = User.all
    @subjects = Subject.select(:name,:id).order("name asc")
    @projects = Project.where("id not in (select distinct(project_id) from implementations where project_id is not null)").order("name asc")
    @oprograms = Oprogram.select(:name, :id).order("name asc")

    respond_to do |format|
          format.html
          format.json do
        
          render json: ::ImplementationDatatable.new(view_context)
        
          end
      end
  end

  # GET /implementations/1
  # GET /implementations/1.json
  def show
  end

  # GET /implementations/new
  def new
    @implementation = Implementation.new
  end

  # GET /implementations/1/edit
  def edit
  end

  # POST /implementations
  # POST /implementations.json

  def modal_create_implementation
    @project_id= params[:project_id]
    @subject= params[:subject]
    @projectmanager= params[:projectmanager]
    @oprogram= params[:oprogram]
    @contact_helper=params[:contact_helper]
    @contact_client=params[:contact_client]
    @projektant=params[:projektant]
    @procurer_name=params[:procurer_name]
    @auditor=params[:auditor]
    @other_contacts=params[:other_contacts]
    @itms_access_name=params[:itms_access_name]
    @itms_access_pass=params[:itms_access_pass]
    @nfp_contract_signed=params[:nfp_contract_signed]
    @project_startdate=params[:project_startdate]
    @project_start_about=params[:project_start_about]
    @project_end_about=params[:project_end_about]
    @project_start_note_sent=params[:project_start_note_sent]
    @project_start_note_sentdate=params[:project_start_note_sentdate]
    @project_enddate_by_nfp_contract=params[:project_enddate_by_nfp_contract]
    @project_schedule_change_need=params[:project_schedule_change_need]
    @schedule_change_need_date=params[:schedule_change_need_date]
    @zop_showdate=params[:zop_showdate]
    @zop_last_term_end=params[:zop_last_term_end]
    @zop_last_term_start=params[:zop_last_term_start]
    @zop_note=params[:zop_note]
    @zop_last_showdate=params[:zop_last_showdate]
    @zop_request_type=params[:zop_request_type]
    @zop_paycond_fulfil=params[:zop_paycond_fulfil]
    @zop_cond_fulfil=params[:zop_cond_fulfil]
    @zop_data_to_itms=params[:zop_data_to_itms]
    @zop_data_to_itms_state=params[:zop_data_to_itms_state]
    @zop_state=params[:zop_state]
    @next_monitor_date=params[:next_monitor_date]
    @finish_monitor_date=params[:finish_monitor_date]
    @control_date=params[:control_date]
    @approved=params[:approved]
    @publicity_subject=params[:publicity_subject]
    @publicity_last_term=params[:publicity_last_term]
    @publicity_showdate=params[:publicity_showdate]
    @project_end_type=params[:project_end_type]
    @project_end_sooner=params[:project_end_sooner]
    @project_end_sooner_date=params[:project_end_sooner_date]
    @note_project_sooner_sent=params[:note_project_sooner_sent]
    @note_project_sooner_sent_date=params[:note_project_sooner_sent_date]

    begin
    @i= Implementation.new(:project_id=>@project_id,:subject_id=>@subject,:user_id=>@projectmanager, :oprogram_id=>@oprogram, :contact_helper=>@contact_helper, :contact_client=>@contact_client, :projektant=>@projektant, :procurer_name=>@procurer_name, :auditor=>@auditor, :other_contacts=>@other_contacts, :itms_access_name=>@itms_access_name, :itms_access_pass=>@itms_access_pass, :nfp_contract_signed=>@nfp_contract_signed, :project_startdate=>@project_startdate, :project_start_about=>@project_start_about, :project_start_note_sentdate=>@project_start_note_sentdate, :project_start_note_sent=>@project_start_note_sent, :project_enddate_by_nfp_contract=>@project_enddate_by_nfp_contract, :project_schedule_change_need=>@project_schedule_change_need, :zop_showdate=>@zop_showdate, :zop_last_term_end=>@zop_last_term_end, :zop_last_term_start=>@zop_last_term_start, :zop_note=>@zop_note, :zop_last_showdate=>@zop_last_showdate, :zop_request_type=>@zop_request_type, :zop_paycond_fulfil=>@zop_paycond_fulfil, :zop_cond_fulfil=>@zop_cond_fulfil, :zop_data_to_itms=>@zop_data_to_itms, :zop_data_to_itms_state=>@zop_data_to_itms_state, :next_monitor_date=>@next_monitor_date, :finish_monitor_date=>@finish_monitor_date, :control_date=>@control_date, :approved=>@approved, :publicity_subject=>@publicity_subject, :publicity_last_term=>@publicity_last_term, :publicity_showdate=>@publicity_showdate, :project_end_type=>@project_end_type, :project_end_sooner=>@project_end_sooner, :project_end_sooner_date=>@project_end_sooner_date, :note_project_sooner_sent=>@note_project_sooner_sent, :note_project_sooner_sent_date=>@note_project_sooner_sent_date, :zop_state=>@zop_state, :schedule_change_need_date=>@schedule_change_need_date, :project_end_about=>@project_end_about)

    
    
  
      if (@i.save)

        @activity = Iactivity.new(:implementation_id=>@i.id, :user_id=>current_user.id, :action=>@i.to_json, :note=>'Implementácia vytvorená')
        @activity.save

          respond_to do |format|
              format.json { render :json => {"status":"ok"}  }
           end
        else
          respond_to do |format|
              format.json { render :json => {"status":"Nepodarilo sa vytvoriť záznam"}  }
           end
         end

    rescue=>error
      redirect_to implementacie_path, :alert=>error.message
    end



  end


    def modal_edit_implementation
      begin
    @implementation_id= params[:implementation_id]

    @orig_implementation = Implementation.find(@implementation_id)

    @subject= params[:subject]
    @projectmanager= params[:projectmanager]
    @oprogram= params[:oprogram]
    @contact_helper=params[:contact_helper]
    @contact_client=params[:contact_client]
    @projektant=params[:projektant]
    @procurer_name=params[:procurer_name]
    @auditor=params[:auditor]
    @other_contacts=params[:other_contacts]
    @itms_access_name=params[:itms_access_name]
    @itms_access_pass=params[:itms_access_pass]
    @nfp_contract_signed=params[:nfp_contract_signed]
    @project_startdate=params[:project_startdate]
    @project_start_about=params[:project_start_about]
    @project_end_about=params[:project_end_about]
    @project_start_note_sent=params[:project_start_note_sent]
    @project_start_note_sentdate=params[:project_start_note_sentdate]
    @project_enddate_by_nfp_contract=params[:project_enddate_by_nfp_contract]
    @project_schedule_change_need=params[:project_schedule_change_need]
    @schedule_change_need_date=params[:schedule_change_need_date]
    @zop_showdate=params[:zop_showdate]
    @zop_last_term_end=params[:zop_last_term_end]
    @zop_last_term_start=params[:zop_last_term_start]
    @zop_note=params[:zop_note]
    @zop_last_showdate=params[:zop_last_showdate]
    @zop_request_type=params[:zop_request_type]
    @zop_paycond_fulfil=params[:zop_paycond_fulfil]
    @zop_cond_fulfil=params[:zop_cond_fulfil]
    @zop_data_to_itms=params[:zop_data_to_itms]
    @zop_data_to_itms_state=params[:zop_data_to_itms_state]
    @zop_state=params[:zop_state]
    @next_monitor_date=params[:next_monitor_date]
    @finish_monitor_date=params[:finish_monitor_date]
    @control_date=params[:control_date]
    @approved=params[:approved]
    @publicity_subject=params[:publicity_subject]
    @publicity_last_term=params[:publicity_last_term]
    @publicity_showdate=params[:publicity_showdate]
    @project_end_type=params[:project_end_type]
    @project_end_sooner=params[:project_end_sooner]
    @project_end_sooner_date=params[:project_end_sooner_date]
    @note_project_sooner_sent=params[:note_project_sooner_sent]
    @note_project_sooner_sent_date=params[:note_project_sooner_sent_date]

    if (@orig_implementation.update_attributes(:subject_id=>@subject,:user_id=>@projectmanager, :oprogram_id=>@oprogram, :contact_helper=>@contact_helper, :contact_client=>@contact_client, :projektant=>@projektant, :procurer_name=>@procurer_name, :auditor=>@auditor, :other_contacts=>@other_contacts, :itms_access_name=>@itms_access_name, :itms_access_pass=>@itms_access_pass, :nfp_contract_signed=>@nfp_contract_signed, :project_startdate=>@project_startdate, :project_start_about=>@project_start_about, :project_start_note_sentdate=>@project_start_note_sentdate, :project_start_note_sent=>@project_start_note_sent, :project_enddate_by_nfp_contract=>@project_enddate_by_nfp_contract, :project_schedule_change_need=>@project_schedule_change_need, :zop_showdate=>@zop_showdate, :zop_last_term_end=>@zop_last_term_end, :zop_last_term_start=>@zop_last_term_start, :zop_note=>@zop_note, :zop_last_showdate=>@zop_last_showdate, :zop_request_type=>@zop_request_type, :zop_paycond_fulfil=>@zop_paycond_fulfil, :zop_cond_fulfil=>@zop_cond_fulfil, :zop_data_to_itms=>@zop_data_to_itms, :zop_data_to_itms_state=>@zop_data_to_itms_state, :next_monitor_date=>@next_monitor_date, :finish_monitor_date=>@finish_monitor_date, :control_date=>@control_date, :approved=>@approved, :publicity_subject=>@publicity_subject, :publicity_last_term=>@publicity_last_term, :publicity_showdate=>@publicity_showdate, :project_end_type=>@project_end_type, :project_end_sooner=>@project_end_sooner, :project_end_sooner_date=>@project_end_sooner_date, :note_project_sooner_sent=>@note_project_sooner_sent, :note_project_sooner_sent_date=>@note_project_sooner_sent_date, :zop_state=>@zop_state, :schedule_change_need_date=>@schedule_change_need_date, :project_end_about=>@project_end_about))

        @activity = Iactivity.new(:implementation_id=>@orig_implementation.id, :user_id=>current_user.id, :action=>@orig_implementation.previous_changes, :action_type=>'implemenation_update', :note=>'Implementácia upravená')
        @activity.save

          respond_to do |format|
              format.json { render :json => {"status":"ok"}  }
           end
        else
          respond_to do |format|
              format.json { render :json => {"status":"Nepodarilo sa upraviť záznam"}  }
           end
         end

    rescue=>error
      redirect_to implementacie_path, :alert=>error.message
    end



  end

  def create
    @implementation = Implementation.new(implementation_params)

    respond_to do |format|
      if @implementation.save
        format.html { redirect_to @implementation, notice: 'Implementation was successfully created.' }
        format.json { render :show, status: :created, location: @implementation }
      else
        format.html { render :new }
        format.json { render json: @implementation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /implementations/1
  # PATCH/PUT /implementations/1.json
  def update
    respond_to do |format|
      if @implementation.update(implementation_params)
        format.html { redirect_to @implementation, notice: 'Implementation was successfully updated.' }
        format.json { render :show, status: :ok, location: @implementation }
      else
        format.html { render :edit }
        format.json { render json: @implementation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /implementations/1
  # DELETE /implementations/1.json
  def destroy
    begin
    @implementation.destroy
    respond_to do |format|
      format.html { redirect_to implementations_url, notice: 'Implementácia bola úspešne zmazaná.' }
      format.json { head :no_content }
    end
  rescue=>error
    redirect_to implementacie_path, :alert=>error.message
  end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_implementation
      @implementation = Implementation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def implementation_params
      params.require(:implementation).permit(:project_id, :user_id, :oprogram, :subject_id, :contact_helper, :contact_client, :projektant, :procurer_name, :auditor, :other_contacts, :itms_access_name, :itms_access_pass, :nfp_contract_signed, :project_startdate, :project_start_about, :project_start_note_sentdate, :project_start_note_sent, :project_enddate_by_nfp_contract, :project_schedule_change_need, :zop_showdate, :zop_last_term_end, :zop_last_term_start, :zop_note, :zop_last_showdate, :zop_request_type, :zop_paycond_fulfil, :zop_cond_fulfil, :zop_data_to_itms, :zop_data_to_itms_state, :next_monitor_date, :finish_monitor_date, :control_date, :approved, :publicity_subject, :publicity_last_term, :publicity_showdate, :project_end_type, :project_end_sooner, :project_end_sooner_date, :note_project_sooner_sent, :note_project_sooner_sent_date,:project_end_about,:zop_state,:schedule_change_need_date)
    end
end
