class AddSummaryFieldToChiropracticExaminations < ActiveRecord::Migration
  def change
    add_column :chiropractic_examinations, :summary, :string
  end
end
