class ProjecttargetsController < ApplicationController
  before_action :set_projecttarget, only: [:show, :edit, :update, :destroy]
  #before_action :can_use_seller
  before_action :can_use_project_manager

  # GET /projecttargets
  # GET /projecttargets.json
  def index
    @projecttargets = Projecttarget.all
  end

  # GET /projecttargets/1
  # GET /projecttargets/1.json
  def show
  end

  # GET /projecttargets/new
  def new
    @projecttarget = Projecttarget.new
  end

  # GET /projecttargets/1/edit
  def edit
  end

  def modal_create_project_target
    begin
      name = params[:projtarget]
      about = params[:about]
      

        t=Projecttarget.new
        t.name = name
        t.about = about

        begin
        t.save

        respond_to do |format|
            format.json { render :json => {"status":"ok"}  }
         end

       rescue => error
          respond_to do |format|
            format.json { render :json => {"status": error.message}  }
         end
       end


    rescue => error
      redirect_to projecttargets_path, alert: error.message
    end
  end

  def modal_edit_project_target
    begin
      projtarget_id = params[:projtarget_id]
      name = params[:projtarget]
      about = params[:about]


      t=Projecttarget.find(projtarget_id)      
      t.name = name
      t.about = about

       begin
        t.save

        respond_to do |format|
            format.json { render :json => {"status":"ok"}  }
         end

       rescue => error
          respond_to do |format|
            format.json { render :json => {"status": error.message}  }
         end
       end


    rescue => error
      redirect_to projecttargets_path, alert: error.message
    end
  end

  # POST /projecttargets
  # POST /projecttargets.json
  def create
    @projecttarget = Projecttarget.new(projecttarget_params)

    respond_to do |format|
      if @projecttarget.save
        format.html { redirect_to @projecttarget, notice: 'Projecttarget was successfully created.' }
        format.json { render :show, status: :created, location: @projecttarget }
      else
        format.html { render :new }
        format.json { render json: @projecttarget.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projecttargets/1
  # PATCH/PUT /projecttargets/1.json
  def update
    respond_to do |format|
      if @projecttarget.update(projecttarget_params)
        format.html { redirect_to @projecttarget, notice: 'Projecttarget was successfully updated.' }
        format.json { render :show, status: :ok, location: @projecttarget }
      else
        format.html { render :edit }
        format.json { render json: @projecttarget.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projecttargets/1
  # DELETE /projecttargets/1.json
  def destroy
    @projecttarget.destroy
    respond_to do |format|
      format.html { redirect_to projecttargets_url, notice: 'Projecttarget was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_projecttarget
      @projecttarget = Projecttarget.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def projecttarget_params
      params.require(:projecttarget).permit(:name, :about)
    end
end
