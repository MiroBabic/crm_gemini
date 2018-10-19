class SubjectDatatable < AjaxDatatablesRails::Base

 
  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
       id: { source: "Subject.id", cond: :eq },
       name: {source: "Subject.name"},
       site: {source: "Subject.site"},
       ico: {source: "Subject.ico"},
       district_name: {source: "District.name"},
       district_id: {source: "District.id"},
       county_name: {source: "District.county"},
       subjtype_name: {source: "Subjtype.name"},
       subjtype_about: {source: "Subjtype.about"},
       subjtype_id: {source: "Subjtype.id"},
       citizen_count: {source: "Subject.citizen_count"},
       note: {source: "Subject.note"},
       web: {source: "Subject.web"},
       zaujimavost: {source: "Subject.zaujimavost"},
       created_at: { source: "Subject.created_at" },
       updated_at: { source: "Subject.updated_at" }
    }
  end


def_delegators :@view, :link_to, :concat, :raw, :content_tag


  def data
    records.map do |subject|
      {
        # example:
         id: subject.id,
         name: subject.name,
         site: subject.site,
         ico: subject.ico,
         district_name: subject.district.name,
         district_id: subject.district.id,
         county_name: subject.district.county,
         subjtype_name: subject.subjtype.name,
         subjtype_about: subject.subjtype.about,
         subjtype_id: subject.subjtype.id,
         citizen_count: subject.citizen_count,
         note: subject.note,
         web: subject.web,
         zaujimavost: subject.zaujimavost,
         created_at: subject.created_at,
         updated_at: subject.updated_at,
         delete_subject: link_to(content_tag(:i,nil,class: 'fa fa-trash-o fa-2x') ,subject, method: :delete, data: { confirm: 'Naozaj chceš zmazať tento subjekt? Ak ho zmažeš, zmažú sa aj všetky naviazané osoby.' })
        }
    end
  end

  private


def get_raw_records
  Subject.joins(:district).joins(:subjtype).all
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
