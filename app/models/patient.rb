class Patient < ActiveRecord::Base  
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :date_of_birth
  #validates_presence_of :social_security_number
  validates_presence_of :gender
  
  validates :social_security_number, :format => {
    :with => /^[a-zA-Z0-9]{3}-[a-zA-Z0-9]{2}-[a-zA-Z0-9]{4}$/,
    :message => "should have format 'xxx-xx-xxxx'"
    }, :allow_blank => true, :if => :social_security_number_changed?
  
  belongs_to :client
  has_many :accidents, :dependent => :destroy

  def full_name
    return self.first_name if self.last_name.blank?
    return "#{self.first_name} #{self.last_name}"
  end
  
  def age
    return Date.today.year - self.date_of_birth.year
  end
  
  def height
    "#{self.height_feet_component} ' #{self.height_inches_component} \""
  end
  
  def primary_insurance_company
    InsuranceCompany.find(self.primary_insurance_company_id).name unless self.primary_insurance_company_id.blank?
  end
  
  def secondary_insurance_company
    InsuranceCompany.find(self.secondary_insurance_company_id).name unless self.secondary_insurance_company_id.blank?
  end
  
  def chiropractic_examinations
    chiropractic_examinations = []
    accidents.each { |accident| chiropractic_examinations.concat accident.chiropractic_examinations}
    chiropractic_examinations
  end

  def last_dated_chriopractice_exam
    ChiropracticExamination.joins(:accident).where('accidents.patient_id = ?', id).order(completed_at: :asc).last
  end

end
