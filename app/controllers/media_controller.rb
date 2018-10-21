class MediaController < ApplicationController
  before_action :set_medium, only: [:show, :edit, :update, :destroy]

  # GET /media
  # GET /media.json
  def index
    @media = Medium.all
    #render :json => @media.collect { |m| m.to_jq_upload }.to_json
  end

  # GET /media/1
  # GET /media/1.json
  def show
  end

  # GET /media/new
  def new
    @medium = Medium.new
  end

  def download_media
    @medium = Medium.find(params[:id])
    send_file(@medium.file.path, :type=>@medium.file_type,:disposition => 'attachment')
  end

  # GET /media/1/edit
  def edit
  end

  # POST /media
  # POST /media.json
  # def create
  #   @medium = Medium.new(medium_params)

  #   respond_to do |format|
  #     if @medium.save
  #       format.html { redirect_to @medium, notice: 'Medium was successfully created.' }
  #       format.json { render :show, status: :created, location: @medium }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @medium.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

   def create
    
    @files = params[:files]

    @subject = params[:subject_media]
    @files.each do |file|

    @totalsize = params[:filetotalsize]

    @medium = Medium.new(:file=>file)

    @del_medium = Medium.where(:file_name=>@medium.file.file.original_filename, :subject_id=>@subject, :file_size => @totalsize).first

    if @del_medium.present?
      @del_medium.destroy
    end
    
    @find_medium = Medium.where(:file_name=>@medium.file.file.original_filename, :subject_id=>@subject).first


    if @find_medium.present?


      size = (@medium.file.size + @find_medium.file.size)

      #@find_medium.file.file.size = (@find_medium.file.file.size + @medium.file.file.size)
      @medium = @find_medium
      @medium.file_size = size

      File.open(@medium.file.path, "ab") { |f| f.write(file.read) }
      
            
    end

    

    @medium.subject_id = @subject

    @medium.file_name = @medium.file.file.original_filename

    if @medium.save
      respond_to do |format|
        format.html {  
          render :json => [@medium.to_jq_upload].to_json, 
          :content_type => 'text/html',
          :layout => false
        }
        format.json {  
          render :json => [@medium.to_jq_upload].to_json     
        }
      end
    else 
      render :json => [{:error => "custom_failure"}], :status => 304
    end

  end
  end

  # PATCH/PUT /media/1
  # PATCH/PUT /media/1.json
  def update
    respond_to do |format|
      if @medium.update(medium_params)
        format.html { redirect_to @medium, notice: 'Medium was successfully updated.' }
        format.json { render :show, status: :ok, location: @medium }
      else
        format.html { render :edit }
        format.json { render json: @medium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /media/1
  # DELETE /media/1.json
  def destroy
    @medium.destroy
    respond_to do |format|
      format.html { redirect_to media_url, notice: 'Súbor bol úspešne zmazaný.' }
      format.json { head :no_content }
    end
  end

  #def destroy
  #  @medium = Medium.find(params[:id])
  ##  @medium.destroy
  #  render :json => true
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medium
      @medium = Medium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medium_params
      params.require(:medium).permit(:file_name, :file_type, :file_size, :file, :file_url, :file_path, :subject_id, :note)
    end
end
