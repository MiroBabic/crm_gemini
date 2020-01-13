class SubjtypesController < ApplicationController
  before_action :set_subjtype, only: [:show, :edit, :update, :destroy]
  before_action :can_use_seller
  before_action :can_use_project_manager

  # GET /subjtypes
  # GET /subjtypes.json
  def index
    @subjtypes = Subjtype.all
  end

  # GET /subjtypes/1
  # GET /subjtypes/1.json
  def show
  end

  # GET /subjtypes/new
  def new
    @subjtype = Subjtype.new
  end

  # GET /subjtypes/1/edit
  def edit
  end

  def modal_create_subj_type
    begin
      name = params[:subjtype]
      about = params[:about]
      

        t=Subjtype.new
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
      redirect_to subjtypes_path, alert: error.message
    end
  end

  def modal_edit_subj_type
    begin
      subjtype_id = params[:subjtype_id]
      name = params[:subjtype]
      about = params[:about]


      t=Subjtype.find(subjtype_id)      
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
      redirect_to subjtypes_path, alert: error.message
    end
  end

  # POST /subjtypes
  # POST /subjtypes.json
  def create
    @subjtype = Subjtype.new(subjtype_params)

    respond_to do |format|
      if @subjtype.save
        format.html { redirect_to @subjtype, notice: 'Subjtype was successfully created.' }
        format.json { render :show, status: :created, location: @subjtype }
      else
        format.html { render :new }
        format.json { render json: @subjtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subjtypes/1
  # PATCH/PUT /subjtypes/1.json
  def update
    respond_to do |format|
      if @subjtype.update(subjtype_params)
        format.html { redirect_to @subjtype, notice: 'Subjtype was successfully updated.' }
        format.json { render :show, status: :ok, location: @subjtype }
      else
        format.html { render :edit }
        format.json { render json: @subjtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subjtypes/1
  # DELETE /subjtypes/1.json
  def destroy
    begin
    @subjtype.destroy
    respond_to do |format|
      format.html { redirect_to subjtypes_url, notice: 'Subjtype was successfully destroyed.' }
      format.json { head :no_content }
    end
  rescue=>error
    redirect_to subjtypes_url, :alert=>error.message
  end
  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subjtype
      @subjtype = Subjtype.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subjtype_params
      params.require(:subjtype).permit(:name, :about)
    end
end
