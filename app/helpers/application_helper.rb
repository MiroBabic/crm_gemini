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
	
end
