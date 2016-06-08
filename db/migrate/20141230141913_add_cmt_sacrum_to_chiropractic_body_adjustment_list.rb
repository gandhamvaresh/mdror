class AddCmtSacrumToChiropracticBodyAdjustmentList < ActiveRecord::Migration
  def change
    add_column :chiropractic_body_adjustment_lists, :cmt_sacrum, :boolean
  end
end
