module ProjecttargetsHelper
		def count_total_subject_for_projecttarget(id)

		@result  = ActiveRecord::Base.connection.select_all(ActiveRecord::Base.send(:sanitize_sql_array, [query = "select * from subjects s, json_array_elements_text(s.project_targets) as obj where obj::integer = ?;", id]))
			

		if (@result.present?)
			total = @result.rows.count
		else
			total = 0
		end

		return total
	end
end
