class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    #@projects = Project.all
    params["columns"] ||= { "0" => {"data" => "" } }
    params["length"]  ||= -1

    @users = User.all
    @subjects = Subject.select(:name,:id).order("name asc")

    respond_to do |format|
          format.html
          format.json do
        
          render json: ::ProjectDatatable.new(view_context)
        
          end
      end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  def show_project_detail
    begin
    @project = Project.find(params[:id])
    @implementation = Implementation.find_by_project_id(@project.id)
    @users=User.all.order(:name)
        
    @oprograms = Oprogram.select(:name, :id).order("name asc")
    if @implementation.present?
      @activities = Iactivity.where(:implementation_id=>@implementation.id).order("created_at desc")
    end
    rescue=>error
      redirect_to projekty_path, :alert=>error.message
    end
  end

  # POST /projects
  # POST /projects.json
  def modal_create_project
    @name= params[:name]
    @subject= params[:subject]
    @projectmanager= params[:projectmanager]
    @projectperson= params[:projectperson]
    @contract= params[:contract]
    @order= params[:order]
    @control_zonfp= params[:control_zonfp]
    @note= params[:note]
    @contractor= params[:contractor]
    @sent_sign= params[:sent_sign]
    @submitonline= params[:submitonline]
    @submitprint= params[:submitprint]
    @agreed_pay= params[:agreed_pay]
    @pay= params[:pay]
    @duedate= params[:duedate]
    @payed= params[:payed]

    begin
    @project = Project.new(:name=>@name,:subject_id=>@subject, :person_id=>@projectperson, :user_id=>@projectmanager, :contract=>@contract, :order=>@order, :control_zonfp=>@control_zonfp, :note=>@note, :contractor=>@contractor,:sent_to_sign=>@sent_sign,:submit_online=>@submitonline, :submit_print=>@submitprint, :agreed_payment=>@agreed_pay, :payment=>@pay, :due_date=>@duedate, :payed=>@payed)
  
      if (@project.save)
          respond_to do |format|
              format.json { render :json => {"status":"ok"}  }
           end
        else
          respond_to do |format|
              format.json { render :json => {"status":"Nepodarilo sa vytvoriť záznam"}  }
           end
         end

    rescue=>error
      redirect_to projekty_path, :alert=>error.message
    end

  end

  def modal_edit_project
    @id = params[:id]
    @name= params[:name]
    @subject= params[:subject]
    @projectmanager= params[:projectmanager]
    @projectperson= params[:projectperson]
    @contract= params[:contract]
    @order= params[:order]
    @control_zonfp= params[:control_zonfp]
    @note= params[:note]
    @contractor= params[:contractor]
    @sent_sign= params[:sent_sign]
    @submitonline= params[:submitonline]
    @submitprint= params[:submitprint]
    @agreed_pay= params[:agreed_pay]
    @pay= params[:pay]
    @duedate= params[:duedate]
    @payed= params[:payed]

    begin
    @project = Project.find(@id)

    @project.name=@name
    @project.subject_id=@subject
    @project.person_id=@projectperson
    @project.user_id=@projectmanager
    @project.contract=@contract
    @project.order=@order
    @project.control_zonfp=@control_zonfp
    @project.note=@note
    @project.contractor=@contractor
    @project.sent_to_sign=@sent_sign
    @project.submit_online=@submitonline
    @project.submit_print=@submitprint
    @project.agreed_payment=@agreed_pay
    @project.payment=@pay
    @project.due_date=@duedate
    @project.payed=@payed    
  
      if (@project.save)
          respond_to do |format|
              format.json { render :json => {"status":"ok"}  }
           end
        else
          respond_to do |format|
              format.json { render :json => {"status":"Nepodarilo sa vytvoriť záznam"}  }
           end
         end

    rescue=>error
      redirect_to projekty_path, :alert=>error.message
    end

  end

  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:person_id, :subject_id, :agreed_payment, :contract, :name, :order, :control_zonfp, :note, :contractor, :sent_to_sign, :submit_online, :submit_print, :user_id, :payment, :due_date, :payed)
    end
end
