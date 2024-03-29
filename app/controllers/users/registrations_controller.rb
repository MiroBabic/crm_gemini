class Users::RegistrationsController < Devise::RegistrationsController
# before_action :configure_sign_up_params, only: [:create]
# before_action :configure_account_update_params, only: [:update]
before_action :can_use_seller, :only=> [:modal_edit_user, :modal_create_user, :destroy]
before_action :can_use_project_manager, :only=> [:modal_edit_user, :modal_create_user, :destroy]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  
  def modal_edit_user
    begin
    @user = User.find(params[:user_id])
    type = params[:user_type]
    name = params[:user_name]

    
    @user.user_type = type
    @user.name = name
    if type =='admin'
      @user.admin = true
    end
    @user.save

    respond_to do |format|
            format.json { render :json => {"status":"ok"}  }
         end

    rescue => error
      redirect_to users_path, alert: error.message
    end
  end

  def modal_create_user
    #begin
      email = params[:user_email]
      type = params[:user_type]
      name = params[:user_name]
      password = params[:password]
      password_confirm = params[:password_confirm]

      
      if (password == password_confirm)
        u=User.new
        u.name = name
        u.email = email
        u.user_type = type
        if type =='admin'
          u.admin = true
        end
        u.password = password
        u.save

        respond_to do |format|
            format.json { render :json => {"status":"ok"}  }
         end

       else
        respond_to do |format|
            format.json { render :json => {"status":"Heslo sa nezhoduje"}  }
         end
       end



    #rescue => error
     # redirect_to users_path, alert: error.message
    #end
  end

  def modal_change_user_pass
    unless current_user.admin?
      redirect_to users_path, alert: "Na toto nemáš práva!!!" and return
      throw :halt
    end
    
    begin
    password = params[:user_pass]
    password_confirm = params[:user_pass_confirm]

    if (password == password_confirm)

      @user = User.find(params[:user_id])
      @user.password = password
      @user.save

      respond_to do |format|
            format.json { render :json => {"status":"ok"}  }
         end
    else
      respond_to do |format|
            format.json { render :json => {"status":"Heslo sa nezhoduje"}  }
         end
    end

    rescue=>error
      redirect_to users_path, alert: error.message and return
    end
  end

  def destroy
    begin
   # super
   user = User.find(params[:id])

     
   if user.destroy
    respond_to do |format|
       format.html { redirect_to users_path, notice: 'Užívateľ bol vymazaný.' }
    end
  else
    redirect_to users_path, alert: error.message
  end


  rescue=>error
    redirect_to users_path, alert: error.message
  end
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
