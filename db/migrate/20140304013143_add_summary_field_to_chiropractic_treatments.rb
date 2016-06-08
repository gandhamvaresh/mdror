class AddSummaryFieldToChiropracticTreatments < ActiveRecord::Migration
  def change
    add_column :chiropractic_treatments, :summary, :string
  end
end
