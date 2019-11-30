class SubjectDatatable < AjaxDatatablesRails::Base

 
  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
       id: { source: "Subject.id", cond: :eq },
       subject_name: {source: "Subject.name"},
       subject_name_show: {source: "Subject.name"},
       name: {source: "Subject.name"},
       site: {source: "Subject.site"},
       ico: {source: "Subject.ico"},
       vip: {source: "Subject.vip"},
       district_name: {source: "District.name"},
       district_id: {source: "District.id"},
       county_name: {source: "District.county"},
       subjtype_name: {source: "Subjtype.name"},
       subjtype_about: {source: "Subjtype.about"},
       subjtype_id: {source: "Subjtype.id"},
       citizen_count: {source: "Subject.citizen_count"},
       user_name: {source: "User.name"},
       note: {source: "Subject.note"},
       web: {source: "Subject.web"},
       project_targets_string: {source: "Subject.project_targets_string"},
       zaujimavost: {source: "Subject.zaujimavost"},
       created_at: { source: "Subject.created_at" },
       updated_at: { source: "Subject.updated_at" }
    }
  end


def_delegators :@view, :link_to, :concat, :raw, :content_tag, :show_subject_profile_path, :get_project_targets


  def data
    records.map do |subject|
      {
        # example:
         id: subject.id,
         subject_id: subject.subject_id,
         name: subject.name,
         subject_name: subject.subject_name,
         subject_name_show: link_to(subject.subject_name, show_subject_profile_path(subject.subject_id)),
         site: subject.site,
         ico: subject.ico,
         vip: subject.vip,
         project_targets: subject.project_targets,
         project_targets_string: subject.project_targets_string,
         district_name: subject.district.name,
         district_id: subject.district_id,
         county_name: subject.district.county,
         subjtype_name: subject.subjtype.name,
         subjtype_about: subject.subjtype.about,
         subjtype_id: subject.subjtype_id,
         citizen_count: subject.citizen_count,
         user_name: subject.user.name,
         user_id: subject.user_id,
         note: subject.note,
         web: subject.web,
         #subject_id: subject.subject_id,
         zaujimavost: subject.zaujimavost,
         created_at: subject.created_at_modif,
         updated_at: subject.updated_at_modif,
         delete_subject: link_to(content_tag(:i,nil,class: 'fa fa-trash-o fa-2x') ,("subjects/"+subject.subject_id.to_s), method: :delete, data: { confirm: 'Naozaj chceš zmazať tento subjekt? Ak ho zmažeš, zmažú sa aj všetky naviazané osoby.' })
        }
    end
  end

  private


def get_raw_records
  #Subject.joins(:district).joins(:subjtype).joins(:user).select("subjects.id as id, subjects.name as name, subjects.site as site, subjects.ico as ico, districts.name as district_name,     districts.id as district_id,districts.county as county, subjtypes.name as subjtype_name, subjtypes.id as subjtype_id,     subjtypes.about as subjtype_about, subjects.citizen_count as citizen_count, users.name as user_name, subjects.note as note, subjects.web as web, subjects.zaujimavost as zaujimavost,    subjects.created_at as created_at, subjects.updated_at as updated_at").all
  Subject.joins(:district).joins(:subjtype).joins(:user).select("subjects.*,subjects.id as subject_id,subjects.name as subject_name,to_char(subjects.created_at,'YYYY-MM-DD HH24:MI:SS') as created_at_modif,
    to_char(subjects.updated_at,'YYYY-MM-DD HH24:MI:SS') as updated_at_modif,subjects.project_targets_string, districts.name,districts.county,districts.id as district_id,subjtypes.name,subjtypes.id as subjtype_id,users.name,users.email").all
  #Subject.joins(:district).joins(:subjtype).joins(:user).all
end

def get_project_targets(arr)
  @targets= Projecttarget.where(:id=>arr)

  @names = Array.new
  if @targets.present?
    @names = @targets.map {|t| t.name}
  end

  return @names
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
