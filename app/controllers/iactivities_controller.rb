class IactivitiesController < ApplicationController
  before_action :set_iactivity, only: [:show, :edit, :update, :destroy]
  before_action :can_use_seller
  

  # GET /iactivities
  # GET /iactivities.json
  def index
    @iactivities = Iactivity.all
  end

  # GET /iactivities/1
  # GET /iactivities/1.json
  def show
  end

  # GET /iactivities/new
  def new
    @iactivity = Iactivity.new
  end

  # GET /iactivities/1/edit
  def edit
  end

  # POST /iactivities
  # POST /iactivities.json
  def create
    @iactivity = Iactivity.new(iactivity_params)

    respond_to do |format|
      if @iactivity.save
        format.html { redirect_to @iactivity, notice: 'Iactivity was successfully created.' }
        format.json { render :show, status: :created, location: @iactivity }
      else
        format.html { render :new }
        format.json { render json: @iactivity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /iactivities/1
  # PATCH/PUT /iactivities/1.json
  def update
    respond_to do |format|
      if @iactivity.update(iactivity_params)
        format.html { redirect_to @iactivity, notice: 'Iactivity was successfully updated.' }
        format.json { render :show, status: :ok, location: @iactivity }
      else
        format.html { render :edit }
        format.json { render json: @iactivity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /iactivities/1
  # DELETE /iactivities/1.json
  def destroy
    @iactivity.destroy
    respond_to do |format|
      format.html { redirect_to iactivities_url, notice: 'Iactivity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_iactivity
      @iactivity = Iactivity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def iactivity_params
      params.require(:iactivity).permit(:implementation_id, :user_id, :action, :note)
    end
end
