class CreateChiropracticAssessments < ActiveRecord::Migration
  def change
    create_table :chiropractic_assessments do |t|
      t.boolean :assessment_improved
      t.boolean :assessment_unimproved
      t.boolean :assessment_exacerbation
      t.text :updated_diagnosis
      t.text :comments

      t.timestamps
      t.datetime :deleted_at
      
      # Foreign keys
      t.integer :chiropractic_examination_id
    end
  end
end
