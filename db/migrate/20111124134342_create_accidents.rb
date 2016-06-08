class CreateAccidents < ActiveRecord::Migration
  def change
    create_table :accidents do |t|
      t.date :injury_date
      t.text :injury_description
      t.string :accident_type
      t.boolean :wearing_seat_belt
      t.boolean :pedestrian
      t.boolean :driver
      t.boolean :passenger
      t.string :seating_position
      t.boolean :airbag_deploy
      t.boolean :loss_of_consciousness
      t.boolean :lost_time_from_work
      t.boolean :taken_to_hospital
      t.string :hospital_name
      t.string :hospital_transport_mode
      t.boolean :examined
      t.boolean :xrays
      t.boolean :ctscan
      t.boolean :mri
      t.boolean :released
      t.boolean :admitted
      t.text :medications
      t.text :prior_injuries
      t.string :prior_diagnostic_study_mri
      t.string :prior_diagnostic_study_mri_other
      t.string :prior_diagnostic_study_ctscan
      t.string :prior_diagnostic_study_ctscan_other
      t.string :prior_diagnostic_study_emg
      t.text :prior_diagnostic_results
      t.text :medical_history

      t.timestamps
      t.datetime :deleted_at
      
      # Foreign keys
      t.integer :patient_id
    end
  end
end
