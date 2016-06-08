class CreateChiropracticBodyAdjustmentLists < ActiveRecord::Migration
  def change
    create_table :chiropractic_body_adjustment_lists do |t|
      t.boolean :spinal_adjustment_1_2_regions
      t.boolean :spinal_adjustment_3_4_regions
      t.boolean :spinal_adjustment_5_or_more_regions
      t.boolean :extremity_adjustment_shoulder_left
      t.boolean :extremity_adjustment_shoulder_right
      t.boolean :extremity_adjustment_elbow_left
      t.boolean :extremity_adjustment_elbow_right
      t.boolean :extremity_adjustment_wrist_left
      t.boolean :extremity_adjustment_wrist_right
      t.boolean :extremity_adjustment_hip_left
      t.boolean :extremity_adjustment_hip_right
      t.boolean :extremity_adjustment_knee_left
      t.boolean :extremity_adjustment_knee_right
      t.boolean :extremity_adjustment_ankle_left
      t.boolean :extremity_adjustment_ankle_right

      t.timestamps
      t.datetime :deleted_at
      
      # Foreign keys
      t.integer :chiropractic_treatment_id
    end
  end
end
