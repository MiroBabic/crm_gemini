class OprogramsController < ApplicationController
  before_action :set_oprogram, only: [:show, :edit, :update, :destroy]

  # GET /oprograms
  # GET /oprograms.json
  def index
    @oprograms = Oprogram.all
  end

  # GET /oprograms/1
  # GET /oprograms/1.json
  def show
  end

  # GET /oprograms/new
  def new
    @oprogram = Oprogram.new
  end

  # GET /oprograms/1/edit
  def edit
  end


  def modal_create_oprogram
    begin
      name = params[:name]
      note = params[:note]
      

        o=Oprogram.new
        o.name = name
        o.note = note

        begin
        o.save

        respond_to do |format|
            format.json { render :json => {"status":"ok"}  }
         end

       rescue => error
          respond_to do |format|
            format.json { render :json => {"status": error.message}  }
         end
       end


    rescue => error
      redirect_to operacneprogramy_path, alert: error.message
    end
  end

  def modal_edit_oprogram
    begin
      oprogram_id = params[:oprogram_id]
      name = params[:name]
      note = params[:note]


      o=Oprogram.find(oprogram_id)      
      o.name = name
      o.note = note

       begin
        o.save

        respond_to do |format|
            format.json { render :json => {"status":"ok"}  }
         end

       rescue => error
          respond_to do |format|
            format.json { render :json => {"status": error.message}  }
         end
       end


    rescue => error
      redirect_to operacneprogramy_path, alert: error.message
    end
  end

  # POST /oprograms
  # POST /oprograms.json
  def create
    @oprogram = Oprogram.new(oprogram_params)

    respond_to do |format|
      if @oprogram.save
        format.html { redirect_to @oprogram, notice: 'Oprogram was successfully created.' }
        format.json { render :show, status: :created, location: @oprogram }
      else
        format.html { render :new }
        format.json { render json: @oprogram.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /oprograms/1
  # PATCH/PUT /oprograms/1.json
  def update
    respond_to do |format|
      if @oprogram.update(oprogram_params)
        format.html { redirect_to @oprogram, notice: 'Oprogram was successfully updated.' }
        format.json { render :show, status: :ok, location: @oprogram }
      else
        format.html { render :edit }
        format.json { render json: @oprogram.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /oprograms/1
  # DELETE /oprograms/1.json
  def destroy
    @oprogram.destroy
    respond_to do |format|
      format.html { redirect_to oprograms_url, notice: 'Operačný program bol úspešne zmazaný.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_oprogram
      @oprogram = Oprogram.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def oprogram_params
      params.require(:oprogram).permit(:name, :note)
    end
end
