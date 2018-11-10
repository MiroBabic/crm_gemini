class MediaDatatable < AjaxDatatablesRails::Base

 
  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
       id: { source: "Medium.id", cond: :eq },
       file_name: {source: "Medium.file_name"},
       file_type: {source: "Medium.file_type"},
       file_size: {source: "Medium.file_size"},
       subject_name: {source: "Subject.name"},
       subject_name_show: {source: "Subject.name"},
       subject_id: {source: "Subject.id"},
       created_at: { source: "Medium.created_at" },
       updated_at: { source: "Medium.updated_at" }
    }
  end


def_delegators :@view, :link_to, :concat, :raw, :content_tag, :number_to_human_size, :show_subject_profile_path,:download_media_path


  def data
    records.map do |medium|
      {
        # example:
         id: medium.id,
         file_name: medium.file_name,
         file_type: medium.file_type,
         file_size: number_to_human_size(medium.file_size),
         subject_name: medium.subject.name,
         subject_name_show: link_to(medium.subject.name, show_subject_profile_path(medium.subject.id)),
         subject_id: medium.subject.id,
         created_at: medium.created_at,
         updated_at: medium.updated_at,
         download_medium: link_to(content_tag(:i,nil,class: 'fa fa-cloud-download fa-2x'), download_media_path(medium.id), :data => { :turbolinks => 'false' }),
         delete_medium: link_to(content_tag(:i,nil,class: 'fa fa-trash-o fa-2x') ,medium, method: :delete, data: { confirm: 'Naozaj chceš zmazať tento súbor?' })
         
        }
    end
  end

  private


def get_raw_records
  Medium.joins(:subject).all
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
