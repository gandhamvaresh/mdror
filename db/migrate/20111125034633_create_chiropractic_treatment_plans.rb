class CreateChiropracticTreatmentPlans < ActiveRecord::Migration
  def change
    create_table :chiropractic_treatment_plans do |t|
      t.boolean :spine_xray
      t.boolean :spine_xray_cervical
      t.boolean :spine_xray_thoracic
      t.boolean :spine_xray_lumbar
      t.string  :other_xray
      
      t.boolean :need_xray_reports
      t.boolean :need_past_medical_records
      t.boolean :spinal_adjustments
      t.string :spinal_adjustments_frequency
      t.boolean :extremity_adjustments
      t.string :extremity_adjustments_frequency
      t.string :extremity_adjustment_body_part
      t.boolean :therapeutic_modalities
      t.boolean :recommend_medical_consultation
      t.string :recommended_medical_evaluation
      t.boolean :re_examine_in_4_weeks
      
      t.boolean :spine_mri
      t.boolean :spine_mri_cervical
      t.boolean :spine_mri_thoracic
      t.boolean :spine_mri_lumbar
      t.string  :other_mri
      
      t.boolean :spine_ct_scan
      t.boolean :spine_ct_scan_cervical
      t.boolean :spine_ct_scan_thoracic
      t.boolean :spine_ct_scan_lumbar
      t.string  :other_ct_scan
      
      t.boolean :pending_medical_clearance_for_medications
      t.string :taping_frequency
      t.boolean :taping_cervical_paraspinal_scm_trapezious_muscles
      t.boolean :taping_cervical_disc_bulge_disc_herniation
      t.boolean :taping_thoracic_paraspinal_scapular_muscles
      t.boolean :taping_low_back_lumbar_paraspinal_lumbar_erectors
      t.boolean :taping_lumbar_disc_bulge_disc_herniation
      t.boolean :taping_sacroiliac_joint
      t.text    :other_recommendations

      t.timestamps
      t.datetime :deleted_at
      
      # Foreign keys
      t.integer :chiropractic_examination_id
    end
  end
end
