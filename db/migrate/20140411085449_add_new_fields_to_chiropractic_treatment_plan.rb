class AddNewFieldsToChiropracticTreatmentPlan < ActiveRecord::Migration
  def change
    add_column :chiropractic_treatment_plans, :infrared, :boolean
    add_column :chiropractic_treatment_plans, :hot_cold_pack, :boolean
    add_column :chiropractic_treatment_plans, :bio_feedback, :boolean
    add_column :chiropractic_treatment_plans, :self_care_home_mgmt, :boolean
    add_column :chiropractic_treatment_plans, :therapeutic_exercises, :boolean
    add_column :chiropractic_treatment_plans, :therapeutic_functional_activities, :boolean
    
    add_column :chiropractic_treatment_plans, :extremity_adjustment_shoulder_left, :boolean
    add_column :chiropractic_treatment_plans, :extremity_adjustment_shoulder_right, :boolean
    add_column :chiropractic_treatment_plans, :extremity_adjustment_hip_left, :boolean
    add_column :chiropractic_treatment_plans, :extremity_adjustment_hip_right, :boolean
    add_column :chiropractic_treatment_plans, :extremity_adjustment_pelvis_left, :boolean
    add_column :chiropractic_treatment_plans, :extremity_adjustment_pelvis_right, :boolean
  end
end
