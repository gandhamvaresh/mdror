class AddNewFindingsToChiropracticObservationList < ActiveRecord::Migration
  def change
    add_column :chiropractic_observation_lists, :findings_patient_was_given_tens_unit_for_trial_period, :boolean
    add_column :chiropractic_observation_lists, :findings_tens_unit_is_helping_patient, :boolean
  end
end
