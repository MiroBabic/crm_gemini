class MailtemplateDatatable < AjaxDatatablesRails::Base

 
  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
       id: { source: "Mailtemplate.id", cond: :eq },
       name: {source: "Mailtemplate.name"},
       content: {source: "Mailtemplate.content"},
       created_at: { source: "Mailtemplate.created_at" },
       updated_at: { source: "Mailtemplate.updated_at" }
    }
  end


def_delegators :@view, :link_to, :concat, :raw, :content_tag


  def data
    records.map do |mailtemplate|
      {
        # example:
         id: mailtemplate.id,
         name: mailtemplate.name,
         content: mailtemplate.content,
         created_at: mailtemplate.created_at,
         updated_at: mailtemplate.updated_at,
         delete_template: link_to(content_tag(:i,nil,class: 'fa fa-trash-o fa-2x') ,mailtemplate, method: :delete, data: { confirm: 'Naozaj chceš zmazať tento záznam?' })
         
        }
    end
  end

  private


def get_raw_records
  Mailtemplate.all
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
