class NotificationMailer < ApplicationMailer

	def send_mass_email(mail,text,sender, subject, smtp_user,smtp_pass,smtp_host,smtp_port,docs,hashmail)
		@text=text
		@mail=mail
		@mail_subject=subject
		@sender=smtp_user

		if smtp_port.to_i == 465
			ssl_conf=true
		else 
			ssl_conf=false
		end


		crypt = ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base)
		@pass_decrypted = crypt.decrypt_and_verify(smtp_pass)

		@hashmail = hashmail


		delivery_options = { user_name: smtp_user,
                         password: @pass_decrypted,
                         address: smtp_host,
                         port: smtp_port,
                         ssl: ssl_conf }

         @documents = Document.where(:id=>docs)

		@documents.each do |doc|
			attachments[doc.file_name] = File.read(doc.file_path)
		end
		mail(from: @sender, to: @mail, subject: @mail_subject, delivery_method_options: delivery_options)
	end
end