class AddNewFieldsToPatient < ActiveRecord::Migration
  def change
    add_column :patients, :street_address, :string
    add_column :patients, :city, :string
    add_column :patients, :state, :string
    add_column :patients, :zip, :string
    add_column :patients, :home_phone, :string
    add_column :patients, :work_phone, :string
    add_column :patients, :email, :string
    
    rename_column :patients, :phone, :cell_phone
    
    add_column :patients, :emergency_contact_name, :string
    add_column :patients, :emergency_contact_phone, :string
    add_column :patients, :emergency_contact_relationship, :string
    
    add_column :patients, :legal_representative_name, :string
    add_column :patients, :legal_representative_street_address, :string
    add_column :patients, :legal_representative_city, :string
    add_column :patients, :legal_representative_state, :string
    add_column :patients, :legal_representative_zip, :string
    add_column :patients, :legal_representative_phone, :string
    add_column :patients, :legal_representative_fax, :string
    
    add_column :patients, :guarantor_name, :string
    add_column :patients, :guarantor_ssn, :string
    add_column :patients, :guarantor_date_of_birth, :date
    add_column :patients, :guarantor_street_address, :string
    add_column :patients, :guarantor_city, :string
    add_column :patients, :guarantor_state, :string
    add_column :patients, :guarantor_zip, :string
    add_column :patients, :guarantor_phone, :string
    add_column :patients, :guarantor_fax, :string
    add_column :patients, :guarantor_email, :string
    
    add_column :patients, :primary_insurance_subscribers_name, :string
    add_column :patients, :primary_insurance_subscribers_date_of_birth, :date
    add_column :patients, :primary_insurance_subscribers_relationship, :string
    
    add_column :patients, :secondary_insurance_subscribers_name, :string
    add_column :patients, :secondary_insurance_subscribers_date_of_birth, :date
    add_column :patients, :secondary_insurance_subscribers_relationship, :string
  end
end
