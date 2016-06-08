class AddNewFieldsToChiropracticObservationList < ActiveRecord::Migration
  def change
    add_column :chiropractic_observation_lists, :symptom_headache, :boolean
    add_column :chiropractic_observation_lists, :symptom_neck_pain, :boolean
    add_column :chiropractic_observation_lists, :symptom_upper_back_pain, :boolean
    add_column :chiropractic_observation_lists, :symptom_mid_back_pain, :boolean
    add_column :chiropractic_observation_lists, :symptom_low_back_pain, :boolean
    add_column :chiropractic_observation_lists, :symptom_pelvis_pain, :boolean
    add_column :chiropractic_observation_lists, :symptom_hip_pain, :boolean
    add_column :chiropractic_observation_lists, :symptom_knee_pain, :boolean
    add_column :chiropractic_observation_lists, :symptom_ankle_pain, :boolean
    add_column :chiropractic_observation_lists, :symptom_shoulder_pain, :boolean
    add_column :chiropractic_observation_lists, :symptom_elbow_pain, :boolean
    add_column :chiropractic_observation_lists, :symptom_wrist_pain, :boolean
    add_column :chiropractic_observation_lists, :symptom_other_pain, :string
        
    add_column :chiropractic_observation_lists, :muscle_spasm_cervical, :boolean
    add_column :chiropractic_observation_lists, :muscle_spasm_thoracic, :boolean
    add_column :chiropractic_observation_lists, :muscle_spasm_lumbar, :boolean
    add_column :chiropractic_observation_lists, :muscle_spasm_hip, :boolean
    add_column :chiropractic_observation_lists, :muscle_spasm_shoulder, :boolean
    add_column :chiropractic_observation_lists, :muscle_spasm_upper_extremity, :boolean
    add_column :chiropractic_observation_lists, :muscle_spasm_lower_extremity, :boolean
    
    add_column :chiropractic_observation_lists, :findings_increased_muscle_spasm, :boolean
    add_column :chiropractic_observation_lists, :findings_increased_apprehension, :boolean
    add_column :chiropractic_observation_lists, :findings_biomechanical_dysfunction, :boolean
    add_column :chiropractic_observation_lists, :findings_upper_trapezius_spasm, :boolean
    add_column :chiropractic_observation_lists, :findings_fibrous_tissue_adhesions, :boolean
    add_column :chiropractic_observation_lists, :findings_activator_technique_used, :boolean
    add_column :chiropractic_observation_lists, :findings_sub_optimal_response, :boolean
    add_column :chiropractic_observation_lists, :findings_life_style_affected_by_pain, :boolean
    add_column :chiropractic_observation_lists, :findings_involuntary_contractions, :boolean
    add_column :chiropractic_observation_lists, :findings_other, :string
    
    add_column :chiropractic_observation_lists, :rom_cervical_spine, :integer, :default => 0
    add_column :chiropractic_observation_lists, :rom_lumbar_spine, :integer, :default => 0
    add_column :chiropractic_observation_lists, :rom_thoracic_spine, :integer, :default => 0
    add_column :chiropractic_observation_lists, :rom_hip, :integer, :default => 0
    add_column :chiropractic_observation_lists, :rom_shoulder, :integer, :default => 0
    add_column :chiropractic_observation_lists, :rom_elbow, :integer, :default => 0
    add_column :chiropractic_observation_lists, :rom_hand, :integer, :default => 0
    add_column :chiropractic_observation_lists, :rom_knee, :integer, :default => 0
    add_column :chiropractic_observation_lists, :rom_ankle, :integer, :default => 0
    
    add_column :chiropractic_observation_lists, :spasm_cervical, :boolean
    add_column :chiropractic_observation_lists, :spasm_thoracic, :boolean
    add_column :chiropractic_observation_lists, :spasm_lumbar, :boolean
    add_column :chiropractic_observation_lists, :spasm_note, :string
    
    add_column :chiropractic_observation_lists, :tenderness_cervical, :boolean
    add_column :chiropractic_observation_lists, :tenderness_thoracic, :boolean
    add_column :chiropractic_observation_lists, :tenderness_lumbar, :boolean
    add_column :chiropractic_observation_lists, :tenderness_note, :string
    
    add_column :chiropractic_observation_lists, :myofacitis_cervical, :boolean
    add_column :chiropractic_observation_lists, :myofacitis_thoracic, :boolean
    add_column :chiropractic_observation_lists, :myofacitis_lumbar, :boolean
    add_column :chiropractic_observation_lists, :myofacitis_note, :string
  end
end
