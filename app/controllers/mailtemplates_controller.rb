class MailtemplatesController < ApplicationController
  before_action :set_mailtemplate, only: [:show, :edit, :update, :destroy]

  # GET /mailtemplates
  # GET /mailtemplates.json
  def index
    #@mailtemplates = Mailtemplate.all
     respond_to do |format|
      format.html
      format.json do
        render json: ::MailtemplateDatatable.new(view_context)
        
      end
    end
  end

  # GET /mailtemplates/1
  # GET /mailtemplates/1.json
  def show
  end

  # GET /mailtemplates/new
  def new
    @mailtemplate = Mailtemplate.new
  end

  # GET /mailtemplates/1/edit
  def edit
  end

  def modal_create_mail_template
    begin
    
      @template = Mailtemplate.new(:name=>params[:name],:content=>params[:content])
      if @template.save
         respond_to do |format|
              format.json { render :json => {"status":"ok"}  }
           end
        else
          respond_to do |format|
              format.json { render :json => {"status":"Nepodarilo sa vložť záznam"}  }
           end
         end
    rescue => error
      redirect_to sablony_path, alert: error.message
    end
  end

  # POST /mailtemplates
  # POST /mailtemplates.json
  def create
    @mailtemplate = Mailtemplate.new(mailtemplate_params)

    respond_to do |format|
      if @mailtemplate.save
        format.html { redirect_to @mailtemplate, notice: 'Mailtemplate was successfully created.' }
        format.json { render :show, status: :created, location: @mailtemplate }
      else
        format.html { render :new }
        format.json { render json: @mailtemplate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mailtemplates/1
  # PATCH/PUT /mailtemplates/1.json
  def update
    respond_to do |format|
      if @mailtemplate.update(mailtemplate_params)
        format.html { redirect_to @mailtemplate, notice: 'Mailtemplate was successfully updated.' }
        format.json { render :show, status: :ok, location: @mailtemplate }
      else
        format.html { render :edit }
        format.json { render json: @mailtemplate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mailtemplates/1
  # DELETE /mailtemplates/1.json
  def destroy
    @mailtemplate.destroy
    respond_to do |format|
      format.html { redirect_to mailtemplates_url, notice: 'Mailtemplate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mailtemplate
      @mailtemplate = Mailtemplate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mailtemplate_params
      params.require(:mailtemplate).permit(:name, :content)
    end
end
