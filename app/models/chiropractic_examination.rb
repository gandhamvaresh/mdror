class ChiropracticExamination < ActiveRecord::Base
  belongs_to :accident
  
  has_one :chiropractic_symptom_list, :dependent => :destroy
  has_one :chiropractic_investigation_list, :dependent => :destroy
  has_one :chiropractic_diagnosis_list, :dependent => :destroy
  has_one :chiropractic_treatment_plan, :dependent => :destroy
  has_one :chiropractic_assessment, :dependent => :destroy
  has_one :chiropractic_compliance, :dependent => :destroy
  
  has_many :chiropractic_treatments, :dependent => :destroy
  
  accepts_nested_attributes_for :chiropractic_symptom_list, :chiropractic_investigation_list, :chiropractic_diagnosis_list, :chiropractic_treatment_plan, :chiropractic_assessment, :chiropractic_compliance
  
  after_save :send_pdf_document_for_claim_processing
  
  def steps
    if self.initial_examination?
      return %w[chiropractic_symptom_list chiropractic_investigation_list chiropractic_diagnosis_list chiropractic_treatment_plan chiropractic_confirmation] 
    else
      return %w[chiropractic_symptom_list chiropractic_investigation_list chiropractic_diagnosis_list chiropractic_assessment chiropractic_treatment_plan chiropractic_compliance chiropractic_confirmation] 
    end
  end
  
  def next_step
    self.current_step = steps[steps.index(current_step)+1]
    self.current_step = steps.last if self.current_step.blank?
  end
  
  def previous_step
    self.current_step = steps[steps.index(current_step)-1]
  end
  
  def first_step?
    self.current_step == steps.first
  end
  
  def last_step?
    self.current_step == steps.last
  end
  
  def visit_number_for_treatment(chiropractic_treatment)
    chiropractic_treatments.index(chiropractic_treatment) + 1
  end
  
  def send_pdf_document_for_claim_processing
    if self.completed? && !self.email_sent?
       UserMailer.delay.completed_examination_email(self)
       self.email_sent = true
       self.save
    end
  end
  
  def doctor
    return User.new unless self.completed?
    return User.find_by_id(self.completed_by) if self.completed?
  end
end
