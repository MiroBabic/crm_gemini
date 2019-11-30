class District < ApplicationRecord
	has_many :subjects

	require 'csv'

	def self.import(file)
		total=0
		success=0
		failed=0

		CSV.foreach(file.path, encoding: "bom|utf-8", headers: true) do |row|
			total = total +1
			
			begin
				@d = District.create! row.to_hash
				success=success+1
			rescue
				failed=failed+1
				next
			end
				
		end
		return rhash ={:total => total,:success=> success,:failed=>failed}
	end
end
