class AddOldsubjektToSubject < ActiveRecord::Migration
  def change
  	add_column :subjects, :oldcrm_subject_id, :integer, :index => true
  	add_column :people, :oldcrm_person_id, :integer, :index => true
  end
end
