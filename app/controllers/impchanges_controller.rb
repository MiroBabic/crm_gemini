class ImpchangesController < ApplicationController
  before_action :set_impchange, only: [:show, :edit, :update, :destroy]

  # GET /impchanges
  # GET /impchanges.json
  def index
    @impchanges = Impchange.all
  end

  # GET /impchanges/1
  # GET /impchanges/1.json
  def show
  end

  # GET /impchanges/new
  def new
    @impchange = Impchange.new
  end

  # GET /impchanges/1/edit
  def edit
  end

  # POST /impchanges
  # POST /impchanges.json
  def create
    @impchange = Impchange.new(impchange_params)

    respond_to do |format|
      if @impchange.save
        format.html { redirect_to @impchange, notice: 'Impchange was successfully created.' }
        format.json { render :show, status: :created, location: @impchange }
      else
        format.html { render :new }
        format.json { render json: @impchange.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /impchanges/1
  # PATCH/PUT /impchanges/1.json
  def update
    respond_to do |format|
      if @impchange.update(impchange_params)
        format.html { redirect_to @impchange, notice: 'Impchange was successfully updated.' }
        format.json { render :show, status: :ok, location: @impchange }
      else
        format.html { render :edit }
        format.json { render json: @impchange.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /impchanges/1
  # DELETE /impchanges/1.json
  def destroy
    @impchange.destroy
    respond_to do |format|
      format.html { redirect_to impchanges_url, notice: 'Impchange was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_impchange
      @impchange = Impchange.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def impchange_params
      params.require(:impchange).permit(:implementation_id, :user_id, :change_last_term, :change_about, :change_status, :change_date)
    end
end
