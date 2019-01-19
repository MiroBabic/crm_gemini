class PersonDatatable < AjaxDatatablesRails::Base

 
  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
       id: { source: "Person.id", cond: :eq },
       first_name: {source: "Person.first_name"},
       last_name: {source: "Person.last_name"},
       email: {source: "Person.email"},
       email2: {source: "Person.email2"},
       phone: {source: "Person.phone"},
       cellphone: {source: "Person.cellphone"},
       note: {source: "Person.note"},
       subject_name: {source: "Subject.name"},
       subject_id: {source: "Subject.id"},
       unsubscribe: {source: "Person.unsubscribe"},
       created_at: { source: "Person.created_at" },
       updated_at: { source: "Person.updated_at" }
    }
  end


def_delegators :@view, :link_to, :concat, :raw, :content_tag


  def data
    records.map do |person|
      {
        # example:
         id: person.id,
         first_name: person.first_name,
         last_name: person.last_name,
         email: person.email,
         email2: person.email2,
         phone: person.phone,
         cellphone: person.cellphone,
         note: person.note,
         subject_name: person.subject.name,
         subject_id: person.subject.id,
         unsubscribe: person.unsubscribe,
         created_at: person.created_at,
         updated_at: person.updated_at,
         delete_person: link_to(content_tag(:i,nil,class: 'fa fa-trash-o fa-2x') ,person, method: :delete, data: { confirm: 'Naozaj chceš zmazať túto osobu?' })
         
        }
    end
  end

  private


def get_raw_records
  Person.joins(:subject).all
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
