class MailtemplatesController < ApplicationController
  before_action :set_mailtemplate, only: [:show, :edit, :update, :destroy]
  before_action :can_use_project_manager

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

  def get_template
    begin
      @template = Mailtemplate.find(params[:id])
        respond_to do |format|
              format.json { render :json => {"status":"ok", "data": @template}  }
           end

    rescue => error
      redirect_to posli_email_path, alert: error.message
    end
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
              format.json { render :json => {"status":"Nepodarilo sa vložiť záznam"}  }
           end
         end
    rescue => error
      redirect_to sablony_path, alert: error.message
    end
  end

  def modal_update_mail_template
     begin
    
      @template = Mailtemplate.find(params[:id])
      @template.name = params[:name]
      @template.content = params[:content]

      if @template.save
         respond_to do |format|
              format.json { render :json => {"status":"ok"}  }
           end
        else
          respond_to do |format|
              format.json { render :json => {"status":"Nepodarilo sa upraviť záznam"}  }
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
        format.html { redirect_to @mailtemplate, notice: 'Šablóna bola úspešne vytvorená.' }
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
        format.html { redirect_to @mailtemplate, notice: 'Šablóna bola úspešne zmenená.' }
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
      format.html { redirect_to mailtemplates_url, notice: 'Šablóna bola úspešne zmazaná.' }
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
