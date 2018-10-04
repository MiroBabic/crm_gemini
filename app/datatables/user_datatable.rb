class UserDatatable < AjaxDatatablesRails::Base

 
  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
       id: { source: "User.id", cond: :eq },
       name: {source: "User.name"},
       email: {source: "User.email"},
       admin: {source: "User.admin"},
       current_sign_in_at: {source: "User.current_sign_in_at"},
       last_sign_in_at: {source: "User.last_sign_in_at"},
       current_sign_in_ip: {source: "User.current_sign_in_ip"},
       last_sign_in_ip: {source: "User.last_sign_in_ip"},
       created_at: { source: "Subject.created_at" },
       updated_at: { source: "Subject.updated_at" }
    }
  end


def_delegators :@view, :link_to, :concat, :raw


  def data
    records.map do |user|
      {
        # example:
         id: user.id,
         name: user.name,
         email: user.email,
         admin: user.admin,
         current_sign_in_at: user.current_sign_in_at,
         last_sign_in_at: user.last_sign_in_at,
         current_sign_in_ip: user.current_sign_in_ip,
         last_sign_in_ip: user.last_sign_in_ip,
         created_at: subject.created_at,
         updated_at: subject.updated_at,
         
        }
    end
  end

  private


def get_raw_records
  User.all
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
