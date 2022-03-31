class StaticPagesController < ApplicationController
	before_action :authenticate_user!, :except=>[:unsubscribe]
	before_action :can_use_seller, :except=> [:contacts, :home, :create_email, :send_mail_to_subjects, :unsubscribe]
	before_action :can_use_project_manager, :except=> [:contacts, :home, :subory, :unsubscribe]


	def contacts
		@districts = District.select(:name,:id).order(:name)
		@subjtypes = Subjtype.select(:name,:id).order(:name)
		#@subjects = Subject.select(:name,:id).order(:name)
		@subjects = Subject.where(:id=>0)
		@projecttargets = Projecttarget.all.order(:name)
		@users = User.all.order(:name)
	end

	def export
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
		#@calendar = Calendar.where("user_id = ? and disabled is not true",current_user.id)
		@calendar = Calendar.where("user_id = ? and disabled is not true and start >= ?",current_user.id, (Date.today - 1) ).order("start desc")
		@users = User.all.order(:name)
		@projects = Project.all.order("updated_at desc")
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

	def unsubscribe
		begin
			require 'base64'
			@hashmail = params[:id]

			crypt = ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base)
			@mail = Base64.urlsafe_decode64(@hashmail)

			@person = Person.where("email = ? or email2 = ?",@mail,@mail)

			if @person.present?
				@person.each do |p|
					p.unsubscribe = true
					p.save
				end
			end

			@message = "Boli ste úspešne odhlásený"
			render :layout => false

		rescue
			@message = "Nepodarilo sa váš email odhlásiť, kontaktujte prosím odosielateľa"
			render :layout => false

		end
	end

	def create_email
		#@subject_types = Subjtype.all.order(:name)
		@subject_types = Subjtype.where("id in (select distinct(subjtype_id) from subjects)")
		@subjects = Subject.all.order(:name)
		@districts = District.all.order(:name)
		@counties =  District.all.pluck(:county).uniq.sort
		@users = User.all
		@templates = Mailtemplate.all.order("updated_at desc")
		#@documents = Document.all
		@docs = Document.all.order("updated_at desc")

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
		require 'base64'

		begin
			@email_subject= params[:email_subject]
			@content= params[:content]
			#@district= params[:district]
			#@county= params[:county]
			#@subjtype= params[:subjtype]
			@obyv_count_from= params[:obyv_count_from]
			@obyv_count_to= params[:obyv_count_to]
			#@user= params[:user]
			@docs= params[:docs]
			@email_acc= params[:email_acc]
			@manual_emails = params[:manual_emails]
			@manual_subjects = params[:manual_subjects]
			@filtered_to_manual = params[:add_filtered_to_manual]

			@onlyvip = params[:onlyvip]
			@onlyark = params[:onlyark]
			@onlycity = params[:onlycity]
			@onlyvillage = params[:onlyvillage]

			if @onlyvip == 'true'
				vip = [true]
			else
				vip = [true,false,nil]
			end

			if @onlyark == 'true'
				ark = [true]
			else
				ark = [true,false,nil]
			end

			if @onlycity == 'true'
				is_city = [true]
			else
				is_city = [true,false,nil]
			end

			if @onlyvillage == 'true'
				is_village = [true]
			else
				is_village = [true,false,nil]
			end


			puts @filtered_to_manual
			puts @filtered_to_manual.class

			@manual_mails_parsed = @manual_emails.delete(" ").gsub(";",",").split(',')
			
			
			#@comm_arr = Array.new

			#check if add filtered subjects or only manual emails
			if @filtered_to_manual == 'true'

			if params[:district].present?
				@district = params[:district]
			else
				@district = District.all.pluck(:id)
			end

			if params[:county].present?
				@county = params[:county]
			else
				@county = District.all.pluck(:county).uniq
			end

			if params[:subjtype].present?
				@subjtype= params[:subjtype]
			else
				@subjtype = Subjtype.all.pluck(:id)
			end

			if params[:user].present?
				@user = params[:user]
			else
				@user = User.all.pluck(:id)
			end

			
			# unless params[:district].present?
			# 	@alldistricts_by_county = District.where(:county => @county)
			# end

			@alldistricts_by_county = District.where(:county => @county)

			@subjects_by_district = Subject.where(:district_id => @district).pluck(:id)
			@subjects_by_county = Subject.where(:district_id => @alldistricts_by_county.pluck(:id)).pluck(:id)
			@subjects_by_owner = Subject.where(:user_id=>@user).pluck(:id)
			@subjects_by_type = Subject.where(:subjtype_id => @subjtype).pluck(:id)

			#@total_subjects = Subject.where(:district_id)


			#@total_subjects = (@subjects_by_district + @subjects_by_county + @subjects_by_owner +@subjects_by_type).uniq
			###new edit ###@total_subjects = @subjects_by_county.merge(@subjects_by_district).merge(@subjects_by_owner).merge(@subjects_by_type).to_a.flatten.uniq
			@total_subjects = (@subjects_by_county & @subjects_by_district & @subjects_by_type & @subjects_by_owner)

			
			#unless @total_subjects.present?
			if (params[:district].empty? && params[:county].empty? && params[:subjtype].empty? && params[:user].empty?)
			
				if @obyv_count_from.present? 
					@total_subjects_min = Subject.where("citizen_count is not null and citizen_count > ?", @obyv_count_from.to_i).pluck(:id)
				else
					@total_subjects_min = []
				end

				if @obyv_count_to.present?
					@total_subjects_max = Subject.where("citizen_count is not null and citizen_count < ?",@obyv_count_to.to_i).pluck(:id)
				else
					@total_subjects_max = []
				end

				@total_subjects = (@total_subjects_min & @total_subjects_max).uniq
					
				#else
				#	redirect_to create_email_path, alert: "Nenašiel sa ani jeden subjekt pre zadané kritéria" and return
      			#	throw :halt
				#end
			end

			#if (@obyv_count_from.present?)
			#	@total_subjects = (@total_subjects.select{|x| x["citizen_count"].to_i >= @obyv_count_from.to_i}).reject{|x| x["citizen_count"].nil?}
			#end

			#if (@obyv_count_to.present?)
			#	#@total_subjects = @total_subjects.where("citizen_count <= ?", @obyv_count_to)
			#	@total_subjects = (@total_subjects.select{|x| x["citizen_count"].to_i <= @obyv_count_to.to_i}).reject{|x| x["citizen_count"].nil?}
			#end

			

			

			#vypnutie zapisovania do komunikacie
			#@total_subjects.each do |subj|
			#	subj.people.each do |person|
			#		c=Communication.new(:subject_id=>subj.id,:person_id=>person.id,:keyword=>"hromadny email",:about=>@email_subject,:user_id=>current_user.id)
			#		@comm_arr.push(c)
			#	end

			#end

			###end check if add filtered to manual
			
			end

			@email_from = Userprofile.where(:user_id=>current_user.id).first.send("email_acc"+@email_acc.to_s)
			@pass = Userprofile.where(:user_id=>current_user.id).first.send("email_pass"+@email_acc.to_s)
			@smtp = Userprofile.where(:user_id=>current_user.id).first.send("smtp"+@email_acc.to_s)
			@port = Userprofile.where(:user_id=>current_user.id).first.send("port"+@email_acc.to_s)


			### process manually entered subjects##
			@man_subj = Subject.where(:id=>@manual_subjects)
			#@man_subj.each do |man_sub|
			#	man_sub.people.each do |person|
			#		c=Communication.new(:subject_id=>man_sub.id,:person_id=>person.id,:keyword=>"hromadny email",:about=>@email_subject,:user_id=>current_user.id)
			#		@comm_arr.push(c)
			#	end
			#end

			@man_subj_ids = @man_subj.map {|a| a.id}.flatten.uniq
			@man_subj_emails = Person.where(:subject_id=>@man_subj_ids,:unsubscribe=>false).pluck(:email,:email2).flatten.uniq

			###


			### process manually entered email addresses
			@manual_mails_parsed.each do |man|
				person = Person.where('email = ? OR email2 = ?',man,man).first
				if (person.present? && person.unsubscribe == true)
					@manual_mails_parsed.delete(man)
				end

				#if (person.present? && person.unsubscribe == false)
				#	c=Communication.new(:subject_id=>person.subject_id,:person_id=>person.id,:keyword=>"hromadny email",:about=>@email_subject,:user_id=>current_user.id)
				#	@comm_arr.push(c)
				#end
			end

			####

			#if @comm_arr.present?
			#	Communication.import @comm_arr
			#end
			
			#@addresses1 = (@total_subjects.map {|a| a.people.map {|b| b.email}}).flatten.uniq
			#@addresses2 = (@total_subjects.map {|a| a.people.map {|b| b.email2}}).flatten.uniq
			if @total_subjects.present?
				
				#	@subjids = @total_subjects.map {|a| a.id}.flatten.uniq
				#else
					@subjids = @total_subjects.uniq
				#end
				
				#@res_addresses = Person.where(:subject_id=>@subjids,:unsubscribe=>false).pluck(:email,:email2).flatten.uniq
				@res_addresses = Person.includes(:subject).where(:subject_id=>@subjids,:unsubscribe=>false,:subjects=>{:vip=>vip,:ark=>ark, :is_city=>is_city, :is_village=>is_village}).pluck(:email,:email2).flatten.uniq

				@res_addresses = @res_addresses.concat(@manual_mails_parsed)
				@res_addresses = @res_addresses.concat(@man_subj_emails).uniq
			else
				@res_addresses = @manual_mails_parsed.concat(@man_subj_emails).uniq

			end


			#@res_addresses = @addresses1.compact + @addresses2.compact

			if @res_addresses.length > 0
				if Delayed::Job.all.exists?
					act_time = Delayed::Job.all.pluck(:run_at).max+1.minute
				else
					act_time=Time.now
				end
				@res_addresses.each_slice(30) do |slice|
					slice.each do |email_address|
						begin
						@hashmail = Base64.urlsafe_encode64(email_address)

						#NotificationMailer.send_mass_email(email_address,@content,@email_from, @email_subject, @email_from,@pass,@smtp,@port,@docs,@hashmail).deliver_later
						NotificationMailer.send_mass_email(email_address,@content,@email_from, @email_subject, @email_from,@pass,@smtp,@port,@docs,@hashmail).deliver_later(wait_until: act_time)

					
					
						rescue => error
							c=Communication.new
							c.about = error.message
							c.save
						end
					end
					act_time=act_time+1.minute
				end
			else
				redirect_to create_email_path, alert: "Nenašiel sa ani jeden email pre zadané kritéria" and return
      				throw :halt
			end

			@addresses_to_show = @res_addresses.join('; ')
			
			respond_to do |format|
              format.json { render :json => {"status":"ok", "content":@content, "addresses":@addresses_to_show}  }
           end
			

		rescue=>error
			redirect_to create_email_path, alert: error.message
		end
	end

def tools
end

def get_delayed_job_status
	require 'open3'
	path = Rails.root.join('bin')
	cmd = path.to_s + '/delayed_job status'
	
	stdout, stderr, status = Open3.capture3(cmd)
	if stdout.present?
		@res = stdout
	else
		@res = stderr
	end
	respond_to do |format|
           format.json { render :json => {"status":"ok", "statusText":@res}  }
     end

end

def get_delayed_job_reset
	require 'open3'
	path = Rails.root.join('bin')
	cmd = path.to_s + '/delayed_job restart'
	stdout, stderr, status = Open3.capture3(cmd)
	if stdout.present?
		@res = stdout
	else
		@res = stderr
	end
	respond_to do |format|
           format.json { render :json => {"status":"ok", "statusText":@res}  }
     end

end

end
