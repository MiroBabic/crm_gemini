class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]
  before_action :can_use_seller
  before_action :can_use_project_manager

  # GET /invoices
  # GET /invoices.json
  def index
    @invoices = Invoice.all
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
  end

  # GET /invoices/1/edit
  def edit
  end

  def tlac_fakturu
    @invoice = Invoice.find(params[:id])

  end

  def modal_edit_inv_amount
    begin
      @invoice = Invoice.find(params[:inv_id])
      @invoice.contracted_amount = params[:inv_amount]

      if (@invoice.save)

       respond_to do |format|
              format.json { render :json => {"status":"ok"}  }
           end
        else
          respond_to do |format|
              format.json { render :json => {"status":"Nepodarilo sa upraviiť záznam"}  }
           end
         end

    rescue=>error
      redirect_to invoices_url, :alert=>error.message
    end
  end

  def modal_edit_inv_text
     begin
      @invoice = Invoice.find(params[:inv_id])
      @invoice.invoice_text = params[:inv_text]

      if (@invoice.save)

       respond_to do |format|
              format.json { render :json => {"status":"ok"}  }
           end
        else
          respond_to do |format|
              format.json { render :json => {"status":"Nepodarilo sa upraviiť záznam"}  }
           end
         end

    rescue=>error
      redirect_to invoices_url, :alert=>error.message
    end
  end

  def modal_create_invoice
    @invoice_no = params[:invoice_no]
    @status = params[:status]
    @invoice_profile = params[:invoice_profile]
    @corp_name = params[:corp_name]
    @corp_address = params[:corp_address]
    @corp_address2 = params[:corp_address2]
    @contracted_amount = params[:contracted_amount]
    @corp_ico = params[:corp_ico]
    @corp_dic = params[:corp_dic]
    @corp_icdph = params[:corp_icdph]
    @invoice_create_date = params[:invoice_create_date]
    @invoice_due_date = params[:invoice_due_date]
    @delivery_date = params[:delivery_date]
    @payment_status = params[:payment_status]


    begin

    @invoice= Invoice.new(:invoice_no=>@invoice_no, :invoice_profile_id=>@invoice_profile, :status=>@status, :contracted_amount=> @contracted_amount, :corp_name=>@corp_name, :corp_address=>@corp_address, :corp_address2=>@corp_address2, :corp_ico=>@corp_ico, :corp_dic=>@corp_dic, :corp_icdph=>@corp_icdph, :invoice_create_date=>@invoice_create_date, :invoice_due_date=>@invoice_due_date, :delivery_date=>@delivery_date, :payment_status=>@payment_status)

    
    
   if (@invoice.save)

       respond_to do |format|
              format.json { render :json => {"status":"ok"}  }
           end
        else
          respond_to do |format|
              format.json { render :json => {"status":"Nepodarilo sa vytvoriť záznam"}  }
           end
         end

    rescue=>error
      redirect_to faktury_path, :alert=>error.message
    end
  end

    def modal_edit_invoice

begin

    @invoice = Invoice.find(params[:id])

    @invoice.invoice_no= params[:invoice_no]
    @invoice.status = params[:status]
    @invoice.contracted_amount = params[:contracted_amount]
    @invoice.invoice_profile_id = params[:invoice_profile]
    @invoice.corp_name = params[:corp_name]
    @invoice.corp_address = params[:corp_address]
    @invoice.corp_address2 = params[:corp_address2]
    @invoice.corp_ico = params[:corp_ico]
    @invoice.corp_dic = params[:corp_dic]
    @invoice.corp_icdph = params[:corp_icdph]
    @invoice.invoice_create_date = params[:invoice_create_date]
    @invoice.invoice_due_date = params[:invoice_due_date]
    @invoice.delivery_date = params[:delivery_date]
    @invoice.payment_status = params[:payment_status]
    

    
   if (@invoice.save)

       respond_to do |format|
              format.json { render :json => {"status":"ok"}  }
           end
        else
          respond_to do |format|
              format.json { render :json => {"status":"Nepodarilo sa upraviiť záznam"}  }
           end
         end

    rescue=>error
      redirect_to faktury_path, :alert=>error.message
    end



  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = Invoice.new(invoice_params)

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url, notice: 'Invoice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params.require(:invoice).permit(:implementation_id, :processed_date, :contracted_amount, :contracted_hours, :document_id, :done_hours)
    end
end
