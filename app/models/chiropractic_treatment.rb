class ChiropracticTreatment < ActiveRecord::Base
  belongs_to :chiropractic_examination
  
  has_one :chiropractic_observation_list, :dependent => :destroy
  has_one :chiropractic_body_adjustment_list, :dependent => :destroy
  has_one :chiropractic_modalities_list, :dependent => :destroy
  
  accepts_nested_attributes_for :chiropractic_observation_list, :chiropractic_body_adjustment_list, :chiropractic_modalities_list
  
  after_save :send_pdf_document_for_claim_processing
  
  def steps
    %w[chiropractic_observation_list chiropractic_body_adjustment_list chiropractic_modalities_list]
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
  
  def send_pdf_document_for_claim_processing
    if self.completed? && !self.email_sent?
       UserMailer.delay.completed_treatment_email(self)
       self.email_sent = true
       self.save
    end
  end
  
  def doctor
    return User.new unless self.completed?
    return User.find_by_id(self.completed_by) if self.completed?
  end
end
