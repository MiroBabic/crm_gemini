module StaticPagesHelper
	def get_args_from_delayed_job(handler)
		res = YAML.parse(handler).to_ruby.job_data["arguments"]
		return res
	end
end
