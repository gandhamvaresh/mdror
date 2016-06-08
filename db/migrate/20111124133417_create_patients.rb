class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.string :social_security_number
      t.string :gender
      t.string :handed
      t.string :occupation
      t.string :phone
      t.string :height_feet_component
      t.string :height_inches_component
      t.string :weight
      t.boolean :ignore_re_examination_reminders, :default => false
      
      t.string :primary_insurance_claim_number
      t.string :primary_insurance_policy_number
      t.integer :primary_insurance_company_id
      
      t.string :secondary_insurance_claim_number
      t.string :secondary_insurance_policy_number
      t.integer :secondary_insurance_company_id
      
      t.timestamps
      t.datetime :deleted_at
      
      # Foreign keys
      t.integer :client_id
    end
  end
end
