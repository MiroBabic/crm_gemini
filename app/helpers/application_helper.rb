module ApplicationHelper

	def resource_name
		:user
	end
	
	def resource
		@resource ||= User.new
	end
	
	def devise_mapping
		@devise_mapping ||= Devise.mappings[:user]
	end
	
	
	def flash_class(level)
		case level
		when 'notice' then "alert alert-info"
		when 'success' then "alert alert-success"
		when 'error' then "alert alert-warning"
		when 'alert' then "alert alert-danger"
		end
	end

	def get_true_false_icon(param)
		begin
			if param == true
				res = '<i class="fa fa-check-square-o fa-2x" aria-hidden="true"></i>'
			else
				res = '<i class="fa fa-window-close-o fa-2x" aria-hidden="true"></i>'
			end
			return res.html_safe
		rescue
			return 'Nezistené'
		end
	end

	def get_activity_icon(action_type)
		begin
			case action_type
			when 'implemenation_create' then res = '<i class="fa fa-plus-circle" aria-hidden="true"></i>'
			when 'implemenation_update' then res = '<i class="fa fa-puzzle-piece" aria-hidden="true"></i>'
			when 'document_upload' then res = '<i class="fa fa-files-o" aria-hidden="true"></i>'
			when 'procurement_change' then res = '<i class="fa fa-university" aria-hidden="true"></i>'
			when 'invoice' then res = '<i class="fa fa-eur" aria-hidden="true"></i>'
			when 'implementation_change' then res = '<i class="fa fa-indent" aria-hidden="true"></i>'
			end

			
			return res.html_safe

		rescue
			res =''
			return res
		end
	end


	def get_activity_color(action_type)
		begin
			case action_type
			when 'implemenation_create' then res = 'blue-bg'
			when 'implemenation_update' then res = 'blue-bg'
			when 'document_upload' then res = 'lazur-bg'
			when 'procurement_change' then res = 'yellow-bg'
			when 'invoice' then res = 'red-bg'
			when 'implementation_change' then res = 'navy-bg'
			end

			return res

		rescue
			res =''
			return res
		end
	end

	def get_activity_details(activity, action_type)
		begin
			myhtml=''
			case action_type
			when 'implemenation_update' then 
				myhtml+='<h4>Zmenené údaje</h4>'
				activity.each do |key,value|
					myhtml += '<p>'+ key +'</p>'
					myhtml += '<li>Stará hodnota</li><span>'+value.first.to_s+'</span>'
					myhtml += '<li>Nová hodnota</li><span>'+value.second.to_s+'</span>'
					myhtml += "<hr>"
				end

			when 'document_upload' then res = 'lazur-bg'
			when 'procurement_change' then res = 'yellow-bg'
			when 'invoice' then res = 'red-bg'
			when 'implementation_change' then res = 'navy-bg'
			end

			return myhtml.html_safe
		rescue
			return 'Nenašli sa bližšie info'
		end
	end



	def prettyDate(date)

  	monthNames = [
		  "Január", "Február", "Marec",
		  "Apríl", "Máj", "Jún", "Júl",
		  "August", "September", "Október",
		  "November", "December"
		];

    if date.present?
  	 @res= (date.day.to_s + '. ' + monthNames[date.month-1].to_s + ' ' + date.year.to_s )
    else
      @res = 'Dátum neuvedený'
    end

    return @res

  end


  def pretty_implementation_activity_field(value)
  	begin

  		res = value
			case value
			when 'user_id' then res = 'Project manager'
			when 'oprogram_id' then res = 'Operačný program'
			when 'contact_helper' then res = 'Kontaktná osoba - Poskytovateľ pomoci'
			when 'contact_client' then res = 'Kontaktná osoba - Klient'
			when 'projektant' then res = 'Projektant'
			when 'procurer_name' then res = 'Verejný obstarávateľ'
			when 'auditor' then res = 'Auditor'
			when 'other_contacts' then res = 'Iné kontaktné osoby'
			when 'itms_access_name' then res = 'Prístup do ITMS - Meno'
			when 'itms_access_pass' then res = 'Prístup do ITMS - Heslo'
			when 'nfp_contract_signed' then res = 'Dátum podpisu zmluvy o NFP'
			when 'nfp_contract_effective' then res = 'Dátum účinnosti zmluvy o NFP'
			when 'project_startdate' then res = 'Dátum začatia projektu'
			when 'project_start_about' then res = 'Čím sa projekt začína'
			when 'project_start_note_sentdate' then res = 'Zaslanie hlásenia o začatí projektu - dátum'
			when 'project_start_note_sent' then res = 'Zaslanie hlásenia o začatí projektu Áno/Nie'
			when 'project_enddate_by_nfp_contract' then res = 'Termín ukončenia projektu podľa zmluvy o NFP'
			when 'project_schedule_change_need' then res = 'Potreba zmeny harmonogramu projektu'
			when 'zop_showdate' then res = 'Dátum predloženia ŽOP'
			when 'zop_last_term_end' then res = 'Posledný termín na predloženie ŽOP záverečná'
			when 'zop_last_term_start' then res = 'Posledný termín na predloženie prvej ŽOP'
			when 'zop_note' then res = 'Poznámka k ŽOP'
			when 'zop_last_showdate' then res = 'Dátum predloženia poslednej ŽOP'
			when 'zop_request_type' then res = 'Typ žiadosti'
			when 'zop_paycond_fulfil' then res = 'Splnené podmienky na úhradu ŽOP'
			when 'zop_cond_fulfil' then res = 'Splnené náležitosti ŽOP'
			when 'zop_data_to_itms' then res = 'Nahratie podkladov do ITMS'
			when 'zop_data_to_itms_state' then res = 'Nahratie podkladov do ITMS - Stav'
			when 'next_monitor_date' then res = 'Termín najbližšej monitorovačky'
			when 'finish_monitor_date' then res = 'Termín záverečnej monitorovačky'
			when 'control_date' then res = 'Dátum predloženia na kontrolu'
			when 'approved' then res = 'Schválenie'
			when 'publicity_subject' then res = 'Predmet publicity'
			when 'publicity_last_term' then res = 'Posledný termín na predloženie publicity projektu'
			when 'publicity_showdate' then res = 'Dátum predloženia'
			when 'project_end_type' then res = 'Spôsob ukončenia projektu'
			when 'project_end_sooner' then res = 'Predčasné ukončenie projektu'
			when 'project_end_sooner_date' then res = 'Predčasné ukončenie projektu - dátum'
			when 'note_project_sooner_sent' then res = 'Zaslanie hlásenia o predčasnom ukončení projektu'
			when 'note_project_sooner_sent_date' then res = 'Zaslanie hlásenia o predčasnom ukončení projektu - dátum'
			when 'zop_state' then res = 'Stav ŽOP'
			when 'schedule_change_need_date' then res = 'Termín na predloženie žiadostí o zmenu harmonogramu'
			when 'project_end_about' then res = 'Čím sa projekt končí'
			when 'project_real_enddate' then res = 'Dátum skutočného ukončenia projektu'
			when 'change_request' then res = 'Predmet žiadosti'
			when 'change_request_last_term' then res = 'Posledný termín na preloženie žiadosti o zmenu'
			when 'change_request_approval' then res = 'Schválenie žiadosti'

				

			end

			return res

		rescue
			res = value
			return res
		end
  end
	
end
