class CreateChiropracticDiagnosisLists < ActiveRecord::Migration
  def change
    create_table :chiropractic_diagnosis_lists do |t|
      t.boolean :cervical_sprain
      t.boolean :cervical_radiculopathy
      t.boolean :cervicalgia
      t.boolean :segmental_dysfunction_c
      t.boolean :cervical_disc_herniation
      t.boolean :cervical_myelopathy
      t.boolean :thoracic_myelopathy
      t.boolean :thoracic_sprain
      t.boolean :thoracic_pain
      t.boolean :segmental_dysfunction_t
      t.boolean :scoliosis
      t.boolean :sciatica
      t.boolean :lumbar_sprain
      t.boolean :lumbar_radiculopathy
      t.boolean :lumbago
      t.boolean :lumbar_disc_herniation
      t.boolean :lumbar_myelopathy
      t.boolean :sacroiliac_sprain
      t.boolean :paresthesia
      t.boolean :segmental_dysfunction_l
      t.boolean :myofascitis
      t.boolean :shoulder_sprain_left
      t.boolean :shoulder_sprain_right
      t.boolean :shoulder_dysfunction_left
      t.boolean :shoulder_dysfunction_right
      t.boolean :elbow_sprain_left
      t.boolean :elbow_sprain_right
      t.boolean :wrist_sprain_left
      t.boolean :wrist_sprain_right
      t.boolean :cervical_trigger_point
      t.boolean :lumbar_trigger_point
      t.boolean :hip_sprain_left
      t.boolean :hip_sprain_right
      t.boolean :hip_dysfunction_left
      t.boolean :hip_dysfunction_right
      t.boolean :knee_sprain_left
      t.boolean :knee_sprain_right
      t.boolean :ankle_sprain_left
      t.boolean :ankle_sprain_right
      t.boolean :headaches
      t.boolean :dizziness
      t.boolean :post_concussive_syndrome
      t.string  :other_diagnosis
      t.string  :other_diagnosis_code
      t.timestamps
      t.datetime :deleted_at
      
      # Foreign keys
      t.integer :chiropractic_examination_id
    end
  end
end
