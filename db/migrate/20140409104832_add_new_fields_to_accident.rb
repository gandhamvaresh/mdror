class AddNewFieldsToAccident < ActiveRecord::Migration
  def change
    add_column :accidents, :days_lost_from_work, :string
    add_column :accidents, :fear_while_driving, :boolean
  end
end
