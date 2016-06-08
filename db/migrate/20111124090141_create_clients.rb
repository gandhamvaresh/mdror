class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :address_line1
      t.string :address_line2
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.string :fax
      t.has_attached_file :report_header
      
      t.timestamps
      t.datetime :deleted_at
    end
  end
end
