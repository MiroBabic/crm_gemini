class ImplementationDatatable < AjaxDatatablesRails::Base

 
  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
       id: { source: "Implementation.id", cond: :eq },
       project_name: {source: "Project.name"},
       project_detail: {source: "Project.name"},
       project_manager: {source: "User.email"},
       subject_path: {source: "Subject.name"},
       subject_name: {source: "Subject.name"},
       oprogram: {source: "Implementation.oprogram"},
       project_startdate: {source: "Implementation.project_startdate"},
       project_enddate_by_nfp_contract: {source: "Implementation.project_enddate_by_nfp_contract"},
       project_start_note_sentdate: {source: "Implementation.project_start_note_sentdate"},
       zop_showdate: {source: "Implementation.zop_showdate"},
       zop_last_term_end: {source: "Implementation.zop_last_term_end"},
       zop_last_term_start: {source: "Implementation.zop_last_term_start"},
       zop_request_type: {source: "Implementation.zop_request_type"},
       next_monitor_date: {source: "Implementation.next_monitor_date"},
       finish_monitor_date: {source: "Implementation.finish_monitor_date"},
       control_date: {source: "Implementation.control_date"},
       approved: {source: "Implementation.approved"},
       created_at: { source: "Project.created_at" },
       updated_at: { source: "Project.updated_at" }
    }
  end


def_delegators :@view, :link_to, :concat, :raw, :content_tag, :show_project_detail_path, :show_subject_profile_path


  def data
    records.map do |implementation|
      {
        # example:
         id: implementation.id,
         user_id: implementation.user_id,
         project_name: implementation.project.name,
         project_detail: link_to(implementation.project.name, show_project_detail_path(implementation.project_id)),
         project_manager: implementation.user.email,
         subject_name: implementation.subject.name,
         subject_path: link_to(implementation.subject.name, show_subject_profile_path(implementation.subject_id)),
         subject_id: implementation.subject.id,
         oprogram: implementation.oprogram,
         project_startdate: implementation.project_startdate,
         project_enddate_by_nfp_contract: implementation.project_enddate_by_nfp_contract,
         project_start_note_sentdate: implementation.project_start_note_sentdate,
         zop_showdate: implementation.zop_showdate,
         zop_last_term_end: implementation.zop_last_term_end,
         zop_last_term_start: implementation.zop_last_term_start,
         zop_request_type: implementation.zop_request_type,
         next_monitor_date: implementation.next_monitor_date,
         finish_monitor_date: implementation.finish_monitor_date,
         control_date: implementation.control_date,
         approved: implementation.approved,
         contact_helper: implementation.contact_helper,
        contact_client: implementation.contact_client,
        projektant: implementation.projektant,
        procurer_name: implementation.procurer_name,
        auditor: implementation.auditor,
        other_contacts: implementation.other_contacts,
        itms_access_name: implementation.itms_access_name,
        itms_access_pass: implementation.itms_access_pass,
        nfp_contract_signed: implementation.nfp_contract_signed,
        project_start_about: implementation.project_start_about,
        project_start_note_sent: implementation.project_start_note_sent,
        project_schedule_change_need: implementation.project_schedule_change_need,
        zop_note: implementation.zop_note,
        zop_last_showdate: implementation.zop_last_showdate,
        zop_paycond_fulfil: implementation.zop_paycond_fulfil,
        zop_cond_fulfil: implementation.zop_cond_fulfil,
        zop_data_to_itms: implementation.zop_data_to_itms,
        zop_data_to_itms_state: implementation.zop_data_to_itms_state,
        publicity_subject: implementation.publicity_subject,
        publicity_last_term: implementation.publicity_last_term,
        publicity_showdate: implementation.publicity_showdate,
        project_end_type: implementation.project_end_type,
        project_end_sooner: implementation.project_end_sooner,
        project_end_sooner_date: implementation.project_end_sooner_date,
        note_project_sooner_sent: implementation.note_project_sooner_sent,
        note_project_sooner_sent_date: implementation.note_project_sooner_sent_date,
         created_at: implementation.created_at,
         updated_at: implementation.updated_at,
         delete_implementation: link_to(content_tag(:i,nil,class: 'fa fa-trash-o fa-2x') ,implementation, method: :delete, data: { confirm: 'Naozaj chceš zmazať tento projekt?' })
         
        }
    end
  end

  private


def get_raw_records
  Implementation.joins(:project).joins(:subject).joins(:user)
end





  # ==== These methods represent the basic operations to perform on records
  # and feel free to override them

  # def filter_records(records)
  # end

  # def sort_records(records)
  # end

  # def paginate_records(records)
  # end

  # ==== Insert 'presenter'-like methods below if necessary
end
