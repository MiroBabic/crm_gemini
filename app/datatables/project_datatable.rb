class ProjectDatatable < AjaxDatatablesRails::Base

 
  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
       id: { source: "Project.id", cond: :eq },
       name: {source: "Project.name"},
       project_detail: {source: "Project.name"},
       person: {source: "Person.email"},
       subject: {source: "Subject.name"},
       subject_path: {source: "Subject.name"},
       contract: {source: "Project.contract"},
       order: {source: "Project.order"},
       control_zonfp: {source: "Project.control_zonfp"},
       note: {source: "Project.note"},
       contractor: {source: "Project.contractor"},
       sent_to_sign: {source: "Project.sent_to_sign"},
       submit_online: {source: "Project.submit_online"},
       submit_print: {source: "Project.submit_print"},
       user: {source: "User.name"},
       agreed_payment: {source: "Project.agreed_payment"},
       payment: {source: "Project.payment"},
       due_date: {source: "Project.due_date"},
       payed: {source: "Project.payed"},
       created_at: { source: "Project.created_at" },
       updated_at: { source: "Project.updated_at" }
    }
  end


def_delegators :@view, :link_to, :concat, :raw, :content_tag, :show_project_detail_path, :show_subject_profile_path


  def data
    records.map do |project|
      {
        # example:
         id: project.id,
         name: project.name,
         project_detail: link_to(project.name, show_project_detail_path(project.id)),
         person: project.person.email,
         person_id: project.person.id,
         subject_id: project.subject.id,
         subject_path: link_to(project.subject.name, show_subject_profile_path(project.subject_id)),
         subject: project.subject.name,
         contract: project.contract,
         order: project.order,
         control_zonfp: project.control_zonfp,
         note: project.note,
         contractor: project.contractor,
         sent_to_sign: project.sent_to_sign,
         submit_online: project.submit_online,
         submit_print: project.submit_print,
         user: project.user.name,
         user_id: project.user.id,
         agreed_payment: project.agreed_payment,
         payment: project.payment,
         due_date: project.due_date,
         payed: project.payed,
         created_at: project.created_at,
         updated_at: project.updated_at,
         delete_project: link_to(content_tag(:i,nil,class: 'fa fa-trash-o fa-2x') ,project, method: :delete, data: { confirm: 'Naozaj chceš zmazať tento projekt?' })
         
        }
    end
  end

  private


def get_raw_records
  Project.joins(:subject).joins(:person).joins(:user)
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
