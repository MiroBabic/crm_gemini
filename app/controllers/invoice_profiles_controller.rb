class InvoiceProfilesController < ApplicationController
  before_action :set_invoice_profile, only: [:show, :edit, :update, :destroy]

  # GET /invoice_profiles
  # GET /invoice_profiles.json
  def index
    @invoice_profiles = InvoiceProfile.all
  end

  # GET /invoice_profiles/1
  # GET /invoice_profiles/1.json
  def show
  end

  # GET /invoice_profiles/new
  def new
    @invoice_profile = InvoiceProfile.new
  end

  # GET /invoice_profiles/1/edit
  def edit
  end

  def modal_create_invprofile
  
    @name = params[:name]
    @address1 = params[:address1]
    @address2= params[:address2]
    @ico= params[:ico]
    @dic= params[:dic]
    @icdph= params[:icdph]
    @bank_name= params[:bank_name]
    @iban= params[:iban]
    @orsr_entry = params[:orsr_entry]

    

    begin

    @invoice_profile= InvoiceProfile.new(:name=>@name, :address1=>@address1, :address2=>@address2, :ico=>@ico, :dic=>@dic, :icdph=>@icdph, :bank_name=>@bank_name, :iban=>@iban,:orsr_entry=>@orsr_entry)

    
    
   if (current_user.admin? && @invoice_profile.save)

       respond_to do |format|
              format.json { render :json => {"status":"ok"}  }
           end
        else
          respond_to do |format|
              format.json { render :json => {"status":"Nepodarilo sa vytvoriť záznam"}  }
           end
         end

    rescue=>error
      redirect_to fakturacne_profily_path, :alert=>error.message
    end
  end

    def modal_edit_invprofile

begin

    @invoice_profile = InvoiceProfile.find(params[:id])

    @invoice_profile.name = params[:name]
    @invoice_profile.address1 = params[:address1]
    @invoice_profile.address2= params[:address2]
    @invoice_profile.ico= params[:ico]
    @invoice_profile.dic= params[:dic]
    @invoice_profile.icdph= params[:icdph]
    @invoice_profile.bank_name= params[:bank_name]
    @invoice_profile.iban= params[:iban]
    @invoice_profile.orsr_entry = params[:orsr_entry]
    

    
   if (current_user.admin? && @invoice_profile.save)

       respond_to do |format|
              format.json { render :json => {"status":"ok"}  }
           end
        else
          respond_to do |format|
              format.json { render :json => {"status":"Nepodarilo sa upraviiť záznam"}  }
           end
         end

    rescue=>error
      redirect_to fakturacne_profily_path, :alert=>error.message
    end



  end

  # POST /invoice_profiles
  # POST /invoice_profiles.json
  def create
    @invoice_profile = InvoiceProfile.new(invoice_profile_params)

    respond_to do |format|
      if @invoice_profile.save
        format.html { redirect_to @invoice_profile, notice: 'Invoice profile was successfully created.' }
        format.json { render :show, status: :created, location: @invoice_profile }
      else
        format.html { render :new }
        format.json { render json: @invoice_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoice_profiles/1
  # PATCH/PUT /invoice_profiles/1.json
  def update
    respond_to do |format|
      if @invoice_profile.update(invoice_profile_params)
        format.html { redirect_to @invoice_profile, notice: 'Invoice profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice_profile }
      else
        format.html { render :edit }
        format.json { render json: @invoice_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoice_profiles/1
  # DELETE /invoice_profiles/1.json
  def destroy
    @invoice_profile.destroy
    respond_to do |format|
      format.html { redirect_to invoice_profiles_url, notice: 'Invoice profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice_profile
      @invoice_profile = InvoiceProfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_profile_params
      params.require(:invoice_profile).permit(:name, :address1, :address2, :ico, :dic, :icdph, :bank_name, :iban)
    end
end
