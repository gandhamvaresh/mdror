class AddNewFieldsToChiropracticModalitiesList < ActiveRecord::Migration
  def change
    add_column :chiropractic_modalities_lists, :infrared, :boolean
    add_column :chiropractic_modalities_lists, :hot_cold_pack, :boolean
    add_column :chiropractic_modalities_lists, :bio_feedback, :boolean
    add_column :chiropractic_modalities_lists, :therapeutic_functional_activities, :boolean
  end
end
