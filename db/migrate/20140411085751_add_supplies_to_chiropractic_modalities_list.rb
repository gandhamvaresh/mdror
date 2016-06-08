class AddSuppliesToChiropracticModalitiesList < ActiveRecord::Migration
  def change
    add_column :chiropractic_modalities_lists, :supplies_bio_freeze, :boolean
    add_column :chiropractic_modalities_lists, :supplies_ice_pack, :boolean
    add_column :chiropractic_modalities_lists, :supplies_lumbar_belt, :boolean
    add_column :chiropractic_modalities_lists, :supplies_cervical_pillow, :boolean
    add_column :chiropractic_modalities_lists, :supplies_cervical_collar, :boolean
  end
end
