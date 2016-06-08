class CreateChiropracticCompliances < ActiveRecord::Migration
  def change
    create_table :chiropractic_compliances do |t|
      t.string :compliance
      t.boolean :compliance_affected_by_transportation
      t.boolean :compliance_affected_by_work_schedule
      t.boolean :compliance_affected_by_personal_matter
      t.string :other_reason_for_compliance

      t.timestamps
      t.datetime :deleted_at
      
      # Foreign keys
      t.integer :chiropractic_examination_id
    end
  end
end
