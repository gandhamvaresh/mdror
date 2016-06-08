class Client < ActiveRecord::Base
  validates_presence_of :name, :address_line1, :city, :state, :phone
  
  has_many :users, :dependent => :destroy
  has_many :patients, :dependent => :destroy
  
  has_many :accidents, :through => :patients
  has_many :chiropractic_examinations, :through => :accidents
  has_many :chiropractic_treatments, :through => :chiropractic_examinations
  
  attr_accessible :name, :address_line1, :address_line2, :city, :state, :zip, :phone, :fax, :claim_recipient_email, :report_header
  
  has_attached_file :report_header, :styles => { :banner => "950x150>" }
  validates_attachment_content_type :report_header, :content_type => /\Aimage\/.*\Z/
end
