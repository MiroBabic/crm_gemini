class UserprofilesController < ApplicationController
  before_action :set_userprofile, only: [:show, :edit, :update, :destroy]

  # GET /userprofiles
  # GET /userprofiles.json
  def index
    @userprofiles = Userprofile.all
  end

  # GET /userprofiles/1
  # GET /userprofiles/1.json
  def show
  end

  # GET /userprofiles/new
  def new
    @userprofile = Userprofile.new
  end

  # GET /userprofiles/1/edit
  def edit
  end

  def del_profile_email
    userId=params[:user_id]
    profile_id = params[:profile_id].to_s

    u=Userprofile.find_by_user_id(userId)
    u.send("email_acc"+profile_id+"=",nil)
    u.send("email_pass"+profile_id+"=",nil)
    u.send("smtp"+profile_id+"=",nil)
    u.send("port"+profile_id+"=",nil)
    
    if u.save
       respond_to do |format|
              format.json { render :json => {"status":"ok"}  }
           end
        else
          respond_to do |format|
              format.json { render :json => {"status":"nepodarilo sa upraviť profil"}  }
           end
      end

  end

  def edit_user_profile
    begin
      @user = User.find(params[:user_id])
      @email1 = params[:email1]
      @name1 = params[:name1]
      @email2 = params[:email2]
      @name2 = params[:name2]
      @email3 = params[:email3]
      @name3 = params[:name3]
      @pass1 = params[:pass1]
      @pass2 = params[:pass2]
      @pass3 = params[:pass3]
      @smtp1 = params[:smtp1]
      @smtp2 = params[:smtp2]
      @smtp3 = params[:smtp3]
      @port1 = params[:port1]
      @port2 = params[:port2]
      @port3 = params[:port3]


      crypt = ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base)

      success = 0
      
    

      if (@email1.present? && @pass1.present? && @smtp1.present? && @port1.present?)
        @profile = Userprofile.find_or_create_by(:user_id=>@user.id)
        @profile.email_acc1 = @email1
        @profile.name_acc1 = @name1
        @profile.email_pass1 = crypt.encrypt_and_sign(@pass1)
        @profile.smtp1 = @smtp1
        @profile.port1 = @port1
        if (@profile.save)
          success = 1
        end
      end

       if (@email2.present? && @pass2.present? && @smtp2.present? && @port2.present?)
        @profile = Userprofile.find_or_create_by(:user_id=>@user.id)
        @profile.email_acc2 = @email2
        @profile.name_acc2 = @name2
        @profile.email_pass2 = crypt.encrypt_and_sign(@pass2)
        @profile.smtp2 = @smtp2
        @profile.port2 = @port2
        if (@profile.save)
          success = 1
        end
      end

       if (@email3.present? && @pass3.present? && @smtp3.present? && @port3.present?)
        @profile = Userprofile.find_or_create_by(:user_id=>@user.id)
        @profile.email_acc3 = @email3
        @profile.name_acc3 = @name3
        @profile.email_pass3 = crypt.encrypt_and_sign(@pass3)
        @profile.smtp3 = @smtp3
        @profile.port3 = @port3
        if (@profile.save)
          success = 1
        end
      end

      if (success==1)

       respond_to do |format|
              format.json { render :json => {"status":"ok"}  }
           end
        else
          respond_to do |format|
              format.json { render :json => {"status":"nepodarilo sa upraviť profil"}  }
           end
      end

    rescue=>error
      redirect_to showprofile_path, alert: error.message
    end
  end

  def showprofile

    @profile = Userprofile.find_by_user_id(current_user.id)
    @user = User.find(current_user.id)
    @subjects = Subject.where(:user_id=>current_user.id)
    @documents = Document.where(:user_id=>current_user.id)
    @calendar = Calendar.where(:user_id=>current_user.id)
    @comms = Communication.where(:user_id=>current_user.id)
  end

  # POST /userprofiles
  # POST /userprofiles.json
  def create
    @userprofile = Userprofile.new(userprofile_params)

    respond_to do |format|
      if @userprofile.save
        format.html { redirect_to @userprofile, notice: 'Userprofile was successfully created.' }
        format.json { render :show, status: :created, location: @userprofile }
      else
        format.html { render :new }
        format.json { render json: @userprofile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /userprofiles/1
  # PATCH/PUT /userprofiles/1.json
  def update
    respond_to do |format|
      if @userprofile.update(userprofile_params)
        format.html { redirect_to @userprofile, notice: 'Userprofile was successfully updated.' }
        format.json { render :show, status: :ok, location: @userprofile }
      else
        format.html { render :edit }
        format.json { render json: @userprofile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /userprofiles/1
  # DELETE /userprofiles/1.json
  def destroy
    @userprofile.destroy
    respond_to do |format|
      format.html { redirect_to userprofiles_url, notice: 'Userprofile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_userprofile
      @userprofile = Userprofile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def userprofile_params
      params.require(:userprofile).permit(:user_id, :smtp1, :port1, :email_acc1, :email_pass1, :smtp2, :port2, :email_acc2, :email_pass2, :smtp3, :port3, :email_acc3, :email_pass3)
    end
end
