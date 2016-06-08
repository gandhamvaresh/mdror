class CreateChiropracticTreatments < ActiveRecord::Migration
  def change
    create_table :chiropractic_treatments do |t|
      t.text :patient_states
      t.date :treatment_date
      t.string :current_step, :default => 'chiropractic_observation_list'
      
      t.boolean :completed, :default => false
      t.datetime :completed_at
      t.integer :completed_by
      
      t.boolean :insurance_claim_filed, :default => false
      t.datetime :insurance_claim_filed_at
      t.integer :insurance_claim_filed_by
      
      t.timestamps
      t.datetime :deleted_at
      t.boolean :email_sent, :default => false
      
      # Foreign keys
      t.integer :chiropractic_examination_id
      t.integer :client_id # Reference key for performance reasons
    end
  end
end
