class AddNewFieldsToChiropracticBodyAdjustmentList < ActiveRecord::Migration
  def change
    add_column :chiropractic_body_adjustment_lists, :cmt_cervical, :boolean
    add_column :chiropractic_body_adjustment_lists, :cmt_thoracic, :boolean
    add_column :chiropractic_body_adjustment_lists, :cmt_lumbar, :boolean
    add_column :chiropractic_body_adjustment_lists, :cmt_hip, :boolean
    add_column :chiropractic_body_adjustment_lists, :cmt_pelvis, :boolean
    add_column :chiropractic_body_adjustment_lists, :cmt_shoulder, :boolean
    add_column :chiropractic_body_adjustment_lists, :cmt_elbow, :boolean
    add_column :chiropractic_body_adjustment_lists, :cmt_hand, :boolean
    add_column :chiropractic_body_adjustment_lists, :cmt_knee, :boolean
    add_column :chiropractic_body_adjustment_lists, :cmt_ankle, :boolean
  end
end
