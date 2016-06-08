class CreateChiropracticSymptomLists < ActiveRecord::Migration
  def change
    create_table :chiropractic_symptom_lists do |t|
      t.boolean :significant_prior_illness_or_injury
      t.integer :pain_level_on_vas_resting
      t.integer :pain_level_on_vas_activity
      t.boolean :neck_pain
      t.string :neck_pain_side
      t.integer :neck_pain_scale
      t.string :neck_pain_radiation_side
      t.boolean :neck_pain_radiates_to_shoulder
      t.boolean :neck_pain_radiates_to_elbow
      t.boolean :neck_pain_radiates_to_hand
      t.boolean :neck_pain_radiates_to_digit1
      t.boolean :neck_pain_radiates_to_digit2
      t.boolean :neck_pain_radiates_to_digit3
      t.boolean :neck_pain_radiates_to_digit4
      t.boolean :neck_pain_radiates_to_digit5
      t.boolean :upper_mid_back_pain
      t.string :upper_mid_back_pain_side
      t.integer :upper_mid_back_pain_scale
      t.string :upper_mid_back_pain_radiation_side
      t.boolean :low_back_pain
      t.string :low_back_pain_side
      t.integer :low_back_pain_scale
      t.string :low_back_pain_radiation_side
      t.boolean :low_back_pain_radiates_to_buttocks
      t.boolean :low_back_pain_radiates_to_thighs
      t.boolean :low_back_pain_radiates_to_calf
      t.boolean :low_back_pain_radiates_to_hips
      t.boolean :low_back_pain_radiates_to_knees
      t.boolean :low_back_pain_radiates_to_foot
      t.boolean :headaches
      t.string :headaches_side
      t.integer :headaches_scale
      t.boolean :headaches_frontal
      t.boolean :headaches_suboccipital
      t.boolean :headaches_temporal
      t.boolean :headaches_bitemporal
      t.boolean :headaches_parietal
      t.boolean :numbness
      t.string :numbness_side
      t.integer :numbness_scale
      t.boolean :numbness_upper_extremity_to_elbow
      t.boolean :numbness_upper_extremity_to_hand
      t.boolean :numbness_lower_extremity_to_knee
      t.boolean :numbness_lower_extremity_to_foot
      t.boolean :tingling
      t.string :tingling_side
      t.integer :tingling_scale
      t.boolean :tingling_upper_extremity_to_elbow
      t.boolean :tingling_upper_extremity_to_hand
      t.boolean :tingling_lower_extremity_to_knee
      t.boolean :tingling_lower_extremity_to_foot
      t.text :other_symptoms

      t.timestamps
      t.datetime :deleted_at
      
      # Foreign keys
      t.integer :chiropractic_examination_id
    end
  end
end
