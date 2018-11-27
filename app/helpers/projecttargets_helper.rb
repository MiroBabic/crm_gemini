module ProjecttargetsHelper
		def count_total_subject_for_projecttarget(id)
		if (id.present? && (id.to_i > 0))
			total = Subject.where(:subjtype_id=>id).count
		else
			total = 0
		end

		return total
	end
end
