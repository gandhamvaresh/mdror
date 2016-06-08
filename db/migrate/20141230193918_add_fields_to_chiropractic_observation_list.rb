class AddFieldsToChiropracticObservationList < ActiveRecord::Migration
  def change
    add_column :chiropractic_observation_lists, :neck_pain, :boolean
    add_column :chiropractic_observation_lists, :neck_pain_side, :string
    add_column :chiropractic_observation_lists,  :neck_pain_scale, :integer
    add_column :chiropractic_observation_lists,  :neck_pain_radiation_side, :string
    add_column :chiropractic_observation_lists,  :neck_pain_radiates_to_shoulder, :boolean
    add_column :chiropractic_observation_lists,  :neck_pain_radiates_to_elbow, :boolean
    add_column :chiropractic_observation_lists,  :neck_pain_radiates_to_hand, :boolean
    add_column :chiropractic_observation_lists,  :neck_pain_radiates_to_digit1, :boolean
    add_column :chiropractic_observation_lists,  :neck_pain_radiates_to_digit2, :boolean
    add_column :chiropractic_observation_lists,  :neck_pain_radiates_to_digit3, :boolean
    add_column :chiropractic_observation_lists,  :neck_pain_radiates_to_digit4, :boolean
    add_column :chiropractic_observation_lists,  :neck_pain_radiates_to_digit5, :boolean
    add_column :chiropractic_observation_lists,  :upper_mid_back_pain, :boolean
    add_column :chiropractic_observation_lists,  :upper_mid_back_pain_side, :string
    add_column :chiropractic_observation_lists,  :upper_mid_back_pain_scale, :integer
    add_column :chiropractic_observation_lists,  :upper_mid_back_pain_radiation_side, :string
    add_column :chiropractic_observation_lists,  :low_back_pain, :boolean
    add_column :chiropractic_observation_lists,  :low_back_pain_side, :string
    add_column :chiropractic_observation_lists,  :low_back_pain_scale, :integer
    add_column :chiropractic_observation_lists,  :low_back_pain_radiation_side, :string
    add_column :chiropractic_observation_lists,  :low_back_pain_radiates_to_buttocks, :boolean
    add_column :chiropractic_observation_lists,  :low_back_pain_radiates_to_thighs, :boolean
    add_column :chiropractic_observation_lists,  :low_back_pain_radiates_to_calf, :boolean
    add_column :chiropractic_observation_lists,  :low_back_pain_radiates_to_hips, :boolean
    add_column :chiropractic_observation_lists,  :low_back_pain_radiates_to_knees, :boolean
    add_column :chiropractic_observation_lists,  :low_back_pain_radiates_to_foot, :boolean
    
  end
end
