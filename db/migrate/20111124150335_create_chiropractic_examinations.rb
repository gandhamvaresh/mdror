class CreateChiropracticExaminations < ActiveRecord::Migration
  def change
    create_table :chiropractic_examinations do |t|
      t.date :examination_date
      t.string :current_step, :default => 'chiropractic_symptom_list'
      
      t.boolean :completed, :default => false
      t.datetime :completed_at
      t.integer :completed_by
      
      t.boolean :insurance_claim_filed, :default => false
      t.datetime :insurance_claim_filed_at
      t.integer :insurance_claim_filed_by
      
      t.boolean :initial_examination
      t.boolean :duration_20_minutes
      t.boolean :duration_30_minutes
      t.boolean :duration_45_minutes
      t.timestamps
      t.datetime :deleted_at
      t.boolean :email_sent, :default => false
      
      # Foreign keys
      t.integer :accident_id
      t.integer :client_id # Reference key for performance reasons
    end
  end
end
