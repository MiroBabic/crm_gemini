class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  # GET /people
  # GET /people.json
  def index
    #@people = Person.all
    respond_to do |format|
      format.html
      format.json do
        render json: ::PersonDatatable.new(view_context)
        
      end
    end
  end

  # GET /people/1
  # GET /people/1.json
  def show
  end

  def get_subject_contacts
    begin
      @subject = Subject.find(params[:id])
      @people = Person.where(:subject_id=>@subject.id)
        respond_to do |format|
        format.json { render :json => {"status":"ok", "data":@people.as_json}  }
      end

    rescue=>error
      redirect_to contacts_path, alert: error.message
    end
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  def modal_create_person
    begin

     contactname_c=params[:contactname_c]
     contactsurname_c=params[:contactsurname_c]
     contactemail_c=params[:contactemail_c]
     contactphone_c=params[:contactphone_c]
     contactcell_c=params[:contactcell_c]
     contactsubject=params[:contactsubject]
     contactnote_c=params[:contactnote_c]


     p=Person.new(:first_name=>contactname_c, :last_name=>contactsurname_c, :email=>contactemail_c,:phone=>contactphone_c,:cellphone=>contactcell_c,:note=>contactnote_c, :subject_id=>contactsubject)
    
    if (p.save)

      respond_to do |format|
        format.json { render :json => {"status":"ok"}  }
      end
    else
      respond_to do |format|
        format.json { render :json => {"status":"nepodarilo sa vložiť záznam"}  }
      end
    end



  rescue => error
    redirect_to contacts_path, alert: error.message
  end
end

def modal_edit_person
     begin

      @person = Person.find(params[:edit_personID])

      @person.first_name = params[:edit_personname]           
      @person.last_name = params[:edit_personsurname]           
      @person.email = params[:edit_email]           
      @person.email2 = params[:edit_email2]           
      @person.phone = params[:edit_tel]           
      @person.cellphone = params[:edit_cell]           
      @person.note = params[:edit_personnote]           
      @person.subject_id = params[:edit_personsubject]           
      

      if (@person.save)
          respond_to do |format|
              format.json { render :json => {"status":"ok"}  }
           end
        else
          respond_to do |format|
              format.json { render :json => {"status":"nepodarilo sa upraviť záznam"}  }
           end
         end


       
    rescue => error
      redirect_to contacts_path, alert: error.message
    end
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Osoba bola úspešne vytvorená.' }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        #format.html { redirect_to @person, notice: 'Osoba bola úspešne upravená.' }
        format.html { redirect_to contacts_url, notice: 'Osoba bola úspešne upravená.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      #format.html { redirect_to people_url, notice: 'Osoba bola úspešne zmazaná.' }
      format.html { redirect_to contacts_url, notice: 'Osoba bola úspešne zmazaná.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:first_name, :last_name, :email, :email2, :phone, :cellphone, :note, :subject_id)
    end
  end
