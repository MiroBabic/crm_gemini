# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20210306214720) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "calendars", force: :cascade do |t|
    t.string   "title"
    t.datetime "start"
    t.datetime "end"
    t.string   "url"
    t.integer  "user_id"
    t.boolean  "all_day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "disabled"
    t.index ["user_id"], name: "index_calendars_on_user_id", using: :btree
  end

  create_table "communications", force: :cascade do |t|
    t.integer  "subject_id"
    t.integer  "person_id"
    t.text     "about"
    t.string   "keyword"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_communications_on_person_id", using: :btree
    t.index ["subject_id"], name: "index_communications_on_subject_id", using: :btree
    t.index ["user_id"], name: "index_communications_on_user_id", using: :btree
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree
    t.index ["queue"], name: "delayed_jobs_queue", using: :btree
  end

  create_table "districts", force: :cascade do |t|
    t.string   "name"
    t.string   "county"
    t.string   "country"
    t.string   "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documents", force: :cascade do |t|
    t.string   "file_name"
    t.string   "file_type"
    t.string   "file_size"
    t.string   "file"
    t.string   "file_url"
    t.string   "file_path"
    t.integer  "user_id"
    t.integer  "subject_id"
    t.string   "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "project_id"
    t.index ["project_id"], name: "index_documents_on_project_id", using: :btree
    t.index ["subject_id"], name: "index_documents_on_subject_id", using: :btree
    t.index ["user_id"], name: "index_documents_on_user_id", using: :btree
  end

  create_table "expenses", force: :cascade do |t|
    t.string   "about"
    t.float    "value_no_vat"
    t.date     "expense_date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "external_companies", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.string   "category"
    t.jsonb    "data"
    t.string   "web_source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["url"], name: "index_external_companies_on_url", unique: true, using: :btree
  end

  create_table "iactivities", force: :cascade do |t|
    t.integer  "implementation_id"
    t.integer  "user_id"
    t.json     "action"
    t.integer  "action_type"
    t.string   "note"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["implementation_id"], name: "index_iactivities_on_implementation_id", using: :btree
    t.index ["user_id"], name: "index_iactivities_on_user_id", using: :btree
  end

  create_table "impchanges", force: :cascade do |t|
    t.integer  "implementation_id"
    t.integer  "user_id"
    t.datetime "change_last_term"
    t.string   "change_about"
    t.string   "change_status"
    t.datetime "change_date"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["implementation_id"], name: "index_impchanges_on_implementation_id", using: :btree
    t.index ["user_id"], name: "index_impchanges_on_user_id", using: :btree
  end

  create_table "implementations", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.string   "oprogram"
    t.integer  "subject_id"
    t.string   "contact_helper"
    t.string   "contact_client"
    t.string   "projektant"
    t.string   "procurer_name"
    t.string   "auditor"
    t.string   "other_contacts"
    t.string   "itms_access_name"
    t.string   "itms_access_pass"
    t.datetime "nfp_contract_signed"
    t.datetime "project_startdate"
    t.string   "project_start_about"
    t.string   "project_end_about"
    t.datetime "project_start_note_sentdate"
    t.boolean  "project_start_note_sent"
    t.datetime "project_enddate_by_nfp_contract"
    t.boolean  "project_schedule_change_need"
    t.datetime "schedule_change_need_date"
    t.datetime "zop_showdate"
    t.datetime "zop_last_term_end"
    t.datetime "zop_last_term_start"
    t.string   "zop_note"
    t.datetime "zop_last_showdate"
    t.string   "zop_request_type"
    t.boolean  "zop_paycond_fulfil"
    t.boolean  "zop_cond_fulfil"
    t.boolean  "zop_data_to_itms"
    t.string   "zop_data_to_itms_state"
    t.string   "zop_state"
    t.datetime "next_monitor_date"
    t.datetime "finish_monitor_date"
    t.datetime "control_date"
    t.boolean  "approved"
    t.string   "publicity_subject"
    t.datetime "publicity_last_term"
    t.datetime "publicity_showdate"
    t.string   "project_end_type"
    t.boolean  "project_end_sooner"
    t.datetime "project_end_sooner_date"
    t.boolean  "note_project_sooner_sent"
    t.datetime "note_project_sooner_sent_date"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "oprogram_id"
    t.datetime "project_real_enddate"
    t.string   "change_request"
    t.datetime "change_request_last_term"
    t.boolean  "change_request_approval"
    t.datetime "nfp_contract_effective"
    t.string   "project_request_code"
    t.string   "project_status"
    t.string   "procurements_string"
    t.json     "procurements"
    t.string   "monitoring_note"
    t.string   "change_request_note"
    t.string   "publicity_note"
    t.index ["oprogram_id"], name: "index_implementations_on_oprogram_id", using: :btree
    t.index ["project_id"], name: "index_implementations_on_project_id", using: :btree
    t.index ["subject_id"], name: "index_implementations_on_subject_id", using: :btree
    t.index ["user_id"], name: "index_implementations_on_user_id", using: :btree
  end

  create_table "implnotes", force: :cascade do |t|
    t.integer  "implementation_id"
    t.text     "note"
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["implementation_id"], name: "index_implnotes_on_implementation_id", using: :btree
    t.index ["user_id"], name: "index_implnotes_on_user_id", using: :btree
  end

  create_table "invoice_profiles", force: :cascade do |t|
    t.string   "name"
    t.string   "address1"
    t.string   "address2"
    t.string   "ico"
    t.string   "dic"
    t.string   "icdph"
    t.string   "bank_name"
    t.string   "iban"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "orsr_entry"
  end

  create_table "invoices", force: :cascade do |t|
    t.decimal  "contracted_amount"
    t.float    "contracted_hours"
    t.float    "done_hours"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "invoice_no"
    t.text     "invoice_text"
    t.string   "corp_name"
    t.string   "corp_ico"
    t.string   "corp_dic"
    t.string   "corp_icdph"
    t.string   "corp_address"
    t.string   "const_symbol"
    t.date     "invoice_create_date"
    t.date     "delivery_date"
    t.date     "invoice_due_date"
    t.string   "payment_type"
    t.string   "status"
    t.integer  "invoice_profile_id"
    t.string   "corp_address2"
    t.boolean  "payment_status",      default: false
    t.date     "real_payment_date"
    t.index ["invoice_profile_id"], name: "index_invoices_on_invoice_profile_id", using: :btree
  end

  create_table "mailtemplates", force: :cascade do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "media", force: :cascade do |t|
    t.string   "file_name"
    t.string   "file_type"
    t.string   "file_size"
    t.string   "file"
    t.string   "file_url"
    t.string   "file_path"
    t.integer  "subject_id"
    t.string   "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id"], name: "index_media_on_subject_id", using: :btree
  end

  create_table "oprograms", force: :cascade do |t|
    t.string   "name"
    t.string   "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "email2"
    t.string   "phone"
    t.string   "cellphone"
    t.string   "note"
    t.integer  "subject_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "oldcrm_person_id"
    t.boolean  "unsubscribe",      default: false
    t.index ["subject_id"], name: "index_people_on_subject_id", using: :btree
  end

  create_table "procurements", force: :cascade do |t|
    t.string   "name"
    t.string   "subject"
    t.datetime "anounced_date"
    t.datetime "close_date"
    t.datetime "control_date"
    t.boolean  "confirmed"
    t.datetime "confirmed_date"
    t.datetime "effective_date"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "procurer_name"
    t.datetime "approval_date"
    t.boolean  "approval"
    t.string   "status"
    t.string   "note"
  end

  create_table "projects", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "subject_id"
    t.string   "name"
    t.string   "contract"
    t.string   "order"
    t.string   "control_zonfp"
    t.string   "note"
    t.string   "contractor"
    t.boolean  "sent_to_sign"
    t.boolean  "submit_online"
    t.boolean  "submit_print"
    t.integer  "user_id"
    t.float    "agreed_payment"
    t.float    "payment"
    t.datetime "due_date"
    t.boolean  "payed"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["person_id"], name: "index_projects_on_person_id", using: :btree
    t.index ["subject_id"], name: "index_projects_on_subject_id", using: :btree
    t.index ["user_id"], name: "index_projects_on_user_id", using: :btree
  end

  create_table "projecttargets", force: :cascade do |t|
    t.string   "name"
    t.text     "about"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "name"
    t.string   "site"
    t.string   "ico"
    t.integer  "district_id"
    t.integer  "subjtype_id"
    t.integer  "user_id"
    t.string   "note"
    t.string   "web"
    t.string   "zaujimavost"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "citizen_count"
    t.boolean  "vip",                    default: false
    t.integer  "oldcrm_subject_id"
    t.json     "project_targets"
    t.text     "project_targets_string"
    t.boolean  "ark",                    default: false
    t.boolean  "is_city",                default: false
    t.boolean  "is_village",             default: false
    t.index ["district_id"], name: "index_subjects_on_district_id", using: :btree
    t.index ["subjtype_id"], name: "index_subjects_on_subjtype_id", using: :btree
    t.index ["user_id"], name: "index_subjects_on_user_id", using: :btree
  end

  create_table "subjtypes", force: :cascade do |t|
    t.string   "name"
    t.string   "about"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "userprofiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "smtp1"
    t.integer  "port1"
    t.string   "email_acc1"
    t.string   "email_pass1"
    t.string   "smtp2"
    t.integer  "port2"
    t.string   "email_acc2"
    t.string   "email_pass2"
    t.string   "smtp3"
    t.integer  "port3"
    t.string   "email_acc3"
    t.string   "email_pass3"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_userprofiles_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.string   "name"
    t.integer  "user_type",              default: 3
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "calendars", "users"
  add_foreign_key "communications", "people"
  add_foreign_key "communications", "subjects"
  add_foreign_key "communications", "users"
  add_foreign_key "documents", "subjects"
  add_foreign_key "documents", "users"
  add_foreign_key "iactivities", "implementations"
  add_foreign_key "iactivities", "users"
  add_foreign_key "impchanges", "implementations"
  add_foreign_key "impchanges", "users"
  add_foreign_key "implementations", "oprograms"
  add_foreign_key "implementations", "projects"
  add_foreign_key "implementations", "subjects"
  add_foreign_key "implementations", "users"
  add_foreign_key "implnotes", "implementations"
  add_foreign_key "implnotes", "users"
  add_foreign_key "invoices", "invoice_profiles"
  add_foreign_key "media", "subjects"
  add_foreign_key "people", "subjects"
  add_foreign_key "projects", "people"
  add_foreign_key "projects", "subjects"
  add_foreign_key "projects", "users"
  add_foreign_key "subjects", "districts"
  add_foreign_key "subjects", "subjtypes"
  add_foreign_key "subjects", "users"
  add_foreign_key "userprofiles", "users"
end
