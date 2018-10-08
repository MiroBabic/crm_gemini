class CommunicationDatatable < AjaxDatatablesRails::Base

 
  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
       id: { source: "Communication.id", cond: :eq },
       about: {source: "Communication.about"},
       keyword: {source: "Communication.keyword"},
       subject_name: {source: "Subject.name"},
       subject_id: {source: "Subject.id"},
       person_first_name: {source: "Person.first_name"},
       person_last_name: {source: "Person.last_name"},
       person_id: {source: "Person.id"},
       user_name: {source: "User.name"},
       user_id: {source: "User.id"},
       created_at: { source: "Communication.created_at" },
       updated_at: { source: "Communication.updated_at" }
    }
  end


def_delegators :@view, :link_to, :concat, :raw, :content_tag


  def data
    records.map do |communication|
      {
        # example:
         id: communication.id,
         about: communication.about,
         keyword: communication.keyword,
         subject_name: communication.subject.name,
         subject_id: communication.subject.id,
         person_first_name: communication.person.first_name,
         person_last_name: communication.person.last_name,
         person_id: communication.person.id,
         user_name: communication.user.name,
         user_id: communication.user.id,
         created_at: communication.created_at,
         updated_at: communication.updated_at,
         delete_communication: link_to(content_tag(:i,nil,class: 'fa fa-trash-o fa-2x') ,communication, method: :delete, data: { confirm: 'Naozaj chceš zmazať tento záznam?' })
         
        }
    end
  end

  private


def get_raw_records
  Communication.joins(:subject).joins(:person).joins(:user).all
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
