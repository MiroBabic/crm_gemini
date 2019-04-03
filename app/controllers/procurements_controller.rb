class ProcurementsController < ApplicationController
  before_action :set_procurement, only: [:show, :edit, :update, :destroy]

  # GET /procurements
  # GET /procurements.json
  def index
    @procurements = Procurement.all
  end

  # GET /procurements/1
  # GET /procurements/1.json
  def show
  end

  # GET /procurements/new
  def new
    @procurement = Procurement.new
  end

  # GET /procurements/1/edit
  def edit
  end

  def get_procurements
    begin

      procs = Procurement.where(:id=>params[:procs])
      respond_to do |format|
              format.json { render :json => {"status":"ok", "data": procs.as_json }  }
      end

    rescue=>error
      respond_to do |format|
              format.json { render :json => {"status":"Nepodarilo sa získať údaje o obstarávaniach"}  }
      end
    end
  end

    def modal_create_procurement

    @procurement_name= params[:procurement_name]
    @procurement_subject= params[:procurement_subject]
    @procurement_control_date= params[:procurement_control_date]
    @procurement_approval_date= params[:procurement_approval_date]
    @procurement_approval= params[:procurement_approval]
    @procurement_status= params[:procurement_status]
    @procurement_note= params[:procurement_note]
    @procurement_procurer_name= params[:procurer_name]





    begin

    @proc= Procurement.new(:name=>@procurement_name, :subject=>@procurement_subject, :control_date=>@procurement_control_date, :approval_date=>@procurement_approval_date, :approval=>@procurement_approval, :note=>@procurement_note, :status=>@procurement_status, :procurer_name=>@procurement_procurer_name)

    
    
   if (@proc.save)

       respond_to do |format|
              format.json { render :json => {"status":"ok"}  }
           end
        else
          respond_to do |format|
              format.json { render :json => {"status":"Nepodarilo sa vytvoriť záznam"}  }
           end
         end

    rescue=>error
      redirect_to obstaravania_path, :alert=>error.message
    end



  end

    def modal_edit_procurement

begin

    @procurement = Procurement.find(params[:id])

    @procurement.name= params[:procurement_name]
    @procurement.subject= params[:procurement_subject]
    @procurement.control_date= params[:procurement_control_date]
    @procurement.approval_date= params[:procurement_approval_date]
    @procurement.approval= params[:procurement_approval]
    @procurement.status= params[:procurement_status]
    @procurement.note= params[:procurement_note]
    @procurement.procurer_name= params[:procurer_name]


    
   if (@procurement.save)

       respond_to do |format|
              format.json { render :json => {"status":"ok"}  }
           end
        else
          respond_to do |format|
              format.json { render :json => {"status":"Nepodarilo sa upraviiť záznam"}  }
           end
         end

    rescue=>error
      redirect_to obstaravania_path, :alert=>error.message
    end



  end

  # POST /procurements
  # POST /procurements.json
  def create
    @procurement = Procurement.new(procurement_params)

    respond_to do |format|
      if @procurement.save
        format.html { redirect_to @procurement, notice: 'Procurement was successfully created.' }
        format.json { render :show, status: :created, location: @procurement }
      else
        format.html { render :new }
        format.json { render json: @procurement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /procurements/1
  # PATCH/PUT /procurements/1.json
  def update
    respond_to do |format|
      if @procurement.update(procurement_params)
        format.html { redirect_to @procurement, notice: 'Procurement was successfully updated.' }
        format.json { render :show, status: :ok, location: @procurement }
      else
        format.html { render :edit }
        format.json { render json: @procurement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /procurements/1
  # DELETE /procurements/1.json
  def destroy
    @procurement.destroy
    respond_to do |format|
      format.html { redirect_to procurements_url, notice: 'Obstarávanie bolo vymazané.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_procurement
      @procurement = Procurement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def procurement_params
      params.require(:procurement).permit(:name, :subject, :anounced_date, :close_date, :control_date, :confirmed, :confirmed_date, :effective_date, :approval_date, :approval, :status, :note, :procurer_name)
    end
end
