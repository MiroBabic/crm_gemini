class CreateImplementations < ActiveRecord::Migration
  def change
    create_table :implementations do |t|
      t.references :project, index: true, foreign_key: true, :unique => true
      t.references :user, index: true, foreign_key: true
      t.string :oprogram
      t.references :subject, index: true, foreign_key: true
      t.string :contact_helper
      t.string :contact_client
      t.string :projektant
      t.string :procurer_name
      t.string :auditor
      t.string :other_contacts
      t.string :itms_access_name
      t.string :itms_access_pass
      t.datetime :nfp_contract_signed
      t.datetime :project_startdate
      t.string :project_start_about
      t.string :project_end_about
      t.datetime :project_start_note_sentdate
      t.boolean :project_start_note_sent
      t.datetime :project_enddate_by_nfp_contract
      t.boolean :project_schedule_change_need
      t.datetime :schedule_change_need_date
      t.datetime :zop_showdate
      t.datetime :zop_last_term_end
      t.datetime :zop_last_term_start
      t.string :zop_note
      t.datetime :zop_last_showdate
      t.string :zop_request_type
      t.boolean :zop_paycond_fulfil
      t.boolean :zop_cond_fulfil
      t.boolean :zop_data_to_itms
      t.string :zop_data_to_itms_state
      t.string :zop_state
      t.datetime :next_monitor_date
      t.datetime :finish_monitor_date
      t.datetime :control_date
      t.boolean :approved
      t.string :publicity_subject
      t.datetime :publicity_last_term
      t.datetime :publicity_showdate
      t.string :project_end_type
      t.boolean :project_end_sooner
      t.datetime :project_end_sooner_date
      t.boolean :note_project_sooner_sent
      t.datetime :note_project_sooner_sent_date

      t.timestamps null: false
    end
  end
end
