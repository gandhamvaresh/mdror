class CreateChiropracticInvestigationLists < ActiveRecord::Migration
  def change
    create_table :chiropractic_investigation_lists do |t|
      t.boolean :ecohymosis
      t.boolean :lacerations
      t.boolean :edema
      t.string :exam_notes
      t.string :systolic_blood_pressure
      t.string :diastolic_blood_pressure
      t.string :pulse
      t.boolean :cranial_nerves_grossly_intact
      t.boolean :cranial_nerves_abnormal
      t.string :cranial_nerves_abnormality
      t.string :crom_flex_exam
      t.boolean :crom_flex_pain
      t.boolean :crom_flex_discomfort
      t.string :lrom_flex_exam
      t.boolean :lrom_flex_pain
      t.boolean :lrom_flex_discomfort
      t.string :crom_ext_exam
      t.boolean :crom_ext_pain
      t.boolean :crom_ext_discomfort
      t.string :lrom_ext_exam
      t.boolean :lrom_ext_pain
      t.boolean :lrom_ext_discomfort
      t.string :crom_lrot_exam
      t.boolean :crom_lrot_pain
      t.boolean :crom_lrot_discomfort
      t.string :lrom_lrot_exam
      t.boolean :lrom_lrot_pain
      t.boolean :lrom_lrot_discomfort
      t.string :crom_rrot_exam
      t.boolean :crom_rrot_pain
      t.boolean :crom_rrot_discomfort
      t.string :lrom_rrot_exam
      t.boolean :lrom_rrot_pain
      t.boolean :lrom_rrot_discomfort
      t.string :crom_llf_exam
      t.boolean :crom_llf_pain
      t.boolean :crom_llf_discomfort
      t.string :lrom_llf_exam
      t.boolean :lrom_llf_pain
      t.boolean :lrom_llf_discomfort
      t.string :crom_rlf_exam
      t.boolean :crom_rlf_pain
      t.boolean :crom_rlf_discomfort
      t.string :lrom_rlf_exam
      t.boolean :lrom_rlf_pain
      t.boolean :lrom_rlf_discomfort
      t.text :other_roms
      t.boolean :cervical_paraspinal_musculature_noted
      t.string :cervical_paraspinal_musculature_side
      t.boolean :throacic_paraspinal_musculature_noted
      t.string :throacic_paraspinal_musculature_side
      t.boolean :lumbar_paraspinal_musculature_noted
      t.string :lumbar_paraspinal_musculature_side
      t.boolean :motor_testing
      t.text :motor_testing_exception
      t.boolean :subluxation_c1
      t.boolean :subluxation_c2
      t.boolean :subluxation_c3
      t.boolean :subluxation_c4
      t.boolean :subluxation_c5
      t.boolean :subluxation_c6
      t.boolean :subluxation_c7
      t.boolean :subluxation_t1
      t.boolean :subluxation_t2
      t.boolean :subluxation_t3
      t.boolean :subluxation_t4
      t.boolean :subluxation_t5
      t.boolean :subluxation_t6
      t.boolean :subluxation_t7
      t.boolean :subluxation_t8
      t.boolean :subluxation_t9
      t.boolean :subluxation_t10
      t.boolean :subluxation_t11
      t.boolean :subluxation_t12
      t.boolean :subluxation_l1
      t.boolean :subluxation_l2
      t.boolean :subluxation_l3
      t.boolean :subluxation_l4
      t.boolean :subluxation_l5
      t.boolean :dermatomes
      t.text :dermatomes_exception
      t.integer :dtr_biceps_right
      t.integer :dtr_biceps_left
      t.integer :dtr_pronator_right
      t.integer :dtr_pronator_left
      t.integer :dtr_triceps_right
      t.integer :dtr_triceps_left
      t.integer :dtr_patella_right
      t.integer :dtr_patella_left
      t.integer :dtr_achilles_right
      t.integer :dtr_achilles_left
      t.boolean :orthopedic_test_cervical_comp_right
      t.boolean :orthopedic_test_cervical_comp_left
      t.boolean :orthopedic_test_distraction_right
      t.boolean :orthopedic_test_distraction_left
      t.boolean :orthopedic_test_shoulder_dep_right
      t.boolean :orthopedic_test_shoulder_dep_left
      t.boolean :orthopedic_test_soto_hall_right
      t.boolean :orthopedic_test_soto_hall_left
      t.boolean :orthopedic_test_slr_right
      t.boolean :orthopedic_test_slr_left
      t.boolean :orthopedic_test_braggard_right
      t.boolean :orthopedic_test_braggard_left
      t.boolean :orthopedic_test_kemps_right
      t.boolean :orthopedic_test_kemps_left
      t.boolean :orthopedic_test_valsalva_right
      t.boolean :orthopedic_test_valsalva_left
      t.boolean :orthopedic_test_nachlas_right
      t.boolean :orthopedic_test_nachlas_left
      t.boolean :orthopedic_test_yeomans_right
      t.boolean :orthopedic_test_yeomans_left
      t.boolean :orthopedic_test_fabere_patrick_right
      t.boolean :orthopedic_test_fabere_patrick_left
      t.boolean :orthopedic_test_elys_right
      t.boolean :orthopedic_test_elys_left
      
      t.boolean :orthopedic_test_georges_right
      t.boolean :orthopedic_test_georges_left
      t.boolean :orthopedic_test_squat_right
      t.boolean :orthopedic_test_squat_left
      t.boolean :orthopedic_test_spurlings_right
      t.boolean :orthopedic_test_spurlings_left
      t.boolean :orthopedic_test_supraspinatus_right
      t.boolean :orthopedic_test_supraspinatus_left
      t.boolean :orthopedic_test_minors_sign_right
      t.boolean :orthopedic_test_minors_sign_left
      t.boolean :orthopedic_test_trendelenberg_right
      t.boolean :orthopedic_test_trendelenberg_left
      t.boolean :orthopedic_test_jackson_right
      t.boolean :orthopedic_test_jackson_left
      
      t.string :orthopedic_test_other
      t.integer :grip_strength_dyn1_right
      t.integer :rip_strength_dyn1_left
      t.integer :grip_strength_dyn2_right
      t.integer :rip_strength_dyn2_left
      t.integer :grip_strength_dyn3_right
      t.integer :rip_strength_dyn3_left
      t.boolean :standing_activity_affected
      t.boolean :sitting_activity_affected
      t.boolean :bending_activity_affected
      t.boolean :lifting_activity_affected
      t.boolean :walking_activity_affected
      t.boolean :sleeping_activity_affected
      t.string :other_activities_affected
      t.text :orthopedic_neuro_tests
      t.text :other_diagnostic_tests
      
      t.timestamps
      t.datetime :deleted_at
      
      # Foreign keys
      t.integer :chiropractic_examination_id
    end
  end
end
