class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update, :destroy]

  # GET /documents
  # GET /documents.json
  def index
    @documents = Document.all
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
  end

  # GET /documents/new
  def new
    @document = Document.new
  end

  # GET /documents/1/edit
  def edit
  end

  def download_doc
    @doc = Document.find(params[:id])
    send_file(@doc.file.path, :type=>@doc.file_type,:disposition => 'attachment')
  end

  def insertfile
    # begin
      
      @doc=Document.new
      @doc.file = params[:file]
      @doc.user_id = current_user.id
      @doc.file_name = @doc.file.file.original_filename

      if params[:docsubject].present?
        @doc.subject_id = params[:docsubject]
      end

      @doc.note = params[:note]
     

      if (@doc.save)
      
        #redirect_to documents_path, notice: "Súbor #{@doc.file_name} bol úspešne nahratý"

        ###redirect_back method  works in rails 5
       # redirect_back fallback_location: documents_path, notice: "Súbor #{@doc.file_name} bol úspešne nahratý"
        begin
          redirect_to :back, notice: "Súbor #{@doc.file_name} bol úspešne nahratý"
        rescue ActionController::RedirectBackError
          redirect_to documents_path, notice: "Súbor #{@doc.file_name} bol úspešne nahratý"
        end

      else
        redirect_to documents_path, alert: "Upload zlyhal."
      end
     # rescue
     #   redirect_to documents_path, alert: "Upload zlyhal."
     # end
  end

  # POST /documents
  # POST /documents.json
  def create
    @document = Document.new(document_params)

    respond_to do |format|
      if @document.save
        format.html { redirect_to @document, notice: 'Document was successfully created.' }
        format.json { render :show, status: :created, location: @document }
      else
        format.html { render :new }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documents/1
  # PATCH/PUT /documents/1.json
  def update
    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to @document, notice: 'Document was successfully updated.' }
        format.json { render :show, status: :ok, location: @document }
      else
        format.html { render :edit }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @document.destroy
    respond_to do |format|
      format.html { redirect_to documents_url, notice: 'Súbor bol úspešne zmazaný.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_params
      params.require(:document).permit(:name, :type, :size, :user_id, :subject_id, :note)
    end
end
