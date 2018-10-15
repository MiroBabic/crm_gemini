json.extract! userprofile, :id, :user_id, :smtp1, :port1, :email_acc1, :email_pass1, :smtp2, :port2, :email_acc2, :email_pass2, :smtp3, :port3, :email_acc3, :email_pass3, :created_at, :updated_at
json.url userprofile_url(userprofile, format: :json)
