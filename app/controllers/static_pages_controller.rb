class StaticPagesController < ApplicationController


	def contacts
		@districts = District.all.order(:name)
		@subjtypes = Subjtype.all.order(:name)
		@subjects = Subject.all.order(:name)
		@projecttargets = Projecttarget.all.order(:name)
	end

	def users
		@users = User.all
	end

	def subory
		#@media = Medium.all
		respond_to do |format|
          format.html
          format.json do
        
        	render json: ::MediaDatatable.new(view_context)
        
      	  end
    	end
	end

	def home
		@calendar = Calendar.where(:user_id=>current_user.id)
	end

	def job_queue
	   @list = Delayed::Job.all
	end

	def delete_delayed_job
		begin
			job = Delayed::Job.find(params[:id])
			job.delete

			respond_to do |format|
        		format.json { render :json => {"status":"ok"}  }
      		end
		rescue=>error
			redirect_to job_queue_path, alert: error.message
		end
	end

	def create_email
		@subject_types = Subjtype.all.order(:name)
		@districts = District.all.order(:name)
		@counties =  District.all.pluck(:county).uniq.sort
		@users = User.all
		@templates = Mailtemplate.all.order("updated_at desc")
		#@documents = Document.all
		@docs = Document.all

		@documents= Array.new
		@docs.each do |doc|
			hh=Hash.new
			hh["id"] = doc.id
			hh["file_name"]=doc.file_name.gsub("_"," ").gsub("-"," ")
		@documents.push(hh)
		end

		@profiles = Userprofile.where(:user_id=>current_user.id)
		@emails_arr = Array.new

		@profiles.each do |p|
			@emails_arr.push(p.email_acc1)
			@emails_arr.push(p.email_acc2)
			@emails_arr.push(p.email_acc3)
		end

		@emails = Array.new
		@emails_arr.each_with_index do |email,index|
			h=Hash.new
			h["id"] = index+1
			h["email"] = email
			@emails.push(h)
		end
	end

	def send_mail_to_subjects
		require 'activerecord-import/base'

		begin
			@email_subject= params[:email_subject]
			@content= params[:content]
			@district= params[:district]
			@county= params[:county]
			@subjtype= params[:subjtype]
			@obyv_count_from= params[:obyv_count_from]
			@obyv_count_to= params[:obyv_count_to]
			@user= params[:user]
			@docs= params[:docs]
			@email_acc= params[:email_acc]

			@alldistricts_by_county = District.where(:county => @county)

			@subjects_by_district = Subject.where(:district_id => @district)
			@subjects_by_county = Subject.where(:district_id => @alldistricts_by_county.pluck(:id))
			@subjects_by_owner = Subject.where(:user_id=>@user)
			@subjects_by_type = Subject.where(:subjtype_id => @subjtype)




			@total_subjects = (@subjects_by_district + @subjects_by_county + @subjects_by_owner +@subjects_by_type).uniq

			unless @total_subjects.present?
				@total_subjects = Subject.all.to_a
			end

			if (@obyv_count_from.present?)
				@total_subjects = (@total_subjects.select{|x| x["citizen_count"].to_i >= @obyv_count_from.to_i}).reject{|x| x["citizen_count"].nil?}
			end

			if (@obyv_count_to.present?)
				#@total_subjects = @total_subjects.where("citizen_count <= ?", @obyv_count_to)
				@total_subjects = (@total_subjects.select{|x| x["citizen_count"].to_i <= @obyv_count_to.to_i}).reject{|x| x["citizen_count"].nil?}
			end

			@email_from = Userprofile.where(:user_id=>current_user.id).first.send("email_acc"+@email_acc.to_s)
			@pass = Userprofile.where(:user_id=>current_user.id).first.send("email_pass"+@email_acc.to_s)
			@smtp = Userprofile.where(:user_id=>current_user.id).first.send("smtp"+@email_acc.to_s)
			@port = Userprofile.where(:user_id=>current_user.id).first.send("port"+@email_acc.to_s)

			@comm_arr = Array.new

			@total_subjects.each do |subj|
				subj.people.each do |person|
					c=Communication.new(:subject_id=>subj.id,:person_id=>person.id,:keyword=>"hromadny email",:about=>@email_subject,:user_id=>current_user.id)
					@comm_arr.push(c)
				end

			end

			if @comm_arr.present?
				Communication.import @comm_arr
			end
			
			@addresses1 = (@total_subjects.map {|a| a.people.map {|b| b.email}}).flatten.uniq
			@addresses2 = (@total_subjects.map {|a| a.people.map {|b| b.email2}}).flatten.uniq

			@res_addresses = @addresses1.compact + @addresses2.compact

			@res_addresses.each do |email_address|
				begin
				NotificationMailer.send_mass_email(email_address,@content,@email_from, @email_subject, @email_from,@pass,@smtp,@port,@docs).deliver_now

				
				
				rescue => error
					c=Communication.new
					c.about = error.message
					c.save
				end
			end

			@addresses_to_show = @res_addresses.join('; ')
			
			respond_to do |format|
              format.json { render :json => {"status":"ok", "content":@content, "addresses":@addresses_to_show}  }
           end
			

		rescue=>error
			redirect_to create_email_path, alert: error.message
		end
	end


	
	
end
