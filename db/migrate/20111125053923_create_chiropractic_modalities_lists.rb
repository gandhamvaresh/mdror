class CreateChiropracticModalitiesLists < ActiveRecord::Migration
  def change
    create_table :chiropractic_modalities_lists do |t|
      t.boolean :ultrasound
      t.boolean :electric_stimulation
      t.boolean :moist_heat
      t.boolean :massage
      t.boolean :mfr_cervical
      t.boolean :mfr_thoracic
      t.boolean :mfr_lumbar
      t.boolean :therapeutic_exercise
      t.boolean :mechanical_traction
      t.boolean :kinetic_activity
      t.boolean :nmr
      t.boolean :gait_training
      t.boolean :exam_re_exam
      t.boolean :home_use_instruction
      t.string :other

      t.timestamps
      t.datetime :deleted_at
      
      # Foreign keys
      t.integer :chiropractic_treatment_id
    end
  end
end
