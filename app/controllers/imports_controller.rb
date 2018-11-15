class ImportsController < ApplicationController

  
  def index
  end

  def importsubjects
  	 
     #begin
      
     @new= Subject.import(params[:file])
      
        redirect_to imports_path, notice: "#{@new[:success]} subjektov bolo uspesne vlozenych a #{@new[:failed]} nepreslo. Spolu bolo zaznamov:  #{@new[:total]}"
      #rescue
       # redirect_to imports_path, alert: "Import nepresiel. Skontroluj subor a jeho strukturu."
      #end

  end

 

end


