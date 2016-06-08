class AddModalitiesToChiropracticTreatmentPlans < ActiveRecord::Migration
  def change    
    add_column :chiropractic_treatment_plans, :ultrasound, :boolean
    add_column :chiropractic_treatment_plans, :electric_stimulation, :boolean
    add_column :chiropractic_treatment_plans, :massage, :boolean
    add_column :chiropractic_treatment_plans, :mfr_cervical, :boolean
    add_column :chiropractic_treatment_plans, :mfr_thoracic, :boolean
    add_column :chiropractic_treatment_plans, :mfr_lumbar, :boolean
    add_column :chiropractic_treatment_plans, :mechanical_traction, :boolean
    add_column :chiropractic_treatment_plans, :other_therapeutic_modality, :string
    
    remove_column :chiropractic_treatment_plans, :therapeutic_modalities
  end
end
