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
	
end
