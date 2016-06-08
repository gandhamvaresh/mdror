class AddNewFieldsToChiropracticDiagnosisList < ActiveRecord::Migration
  def change
    add_column :chiropractic_diagnosis_lists, :sacral_segmental_dysfunction, :boolean
  end
end
