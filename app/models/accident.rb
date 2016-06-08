class Accident < ActiveRecord::Base
  belongs_to :patient
  has_many :chiropractic_examinations, :dependent => :destroy

  def prior_diagnostic_study_mri_details=(attr)
    self.prior_diagnostic_study_mri = attr.join("--")
  end
  
  def prior_diagnostic_study_mri_details
    (self.prior_diagnostic_study_mri || "").split("--")
  end
  
  def prior_diagnostic_study_ctscan_details=(attr)
    self.prior_diagnostic_study_ctscan = attr.join("--")
  end
  
  def prior_diagnostic_study_ctscan_details
    (self.prior_diagnostic_study_ctscan || "").split("--")
  end
  
  def prior_diagnostic_study_emg_details=(attr)
    self.prior_diagnostic_study_emg = attr.join("--")
  end
  
  def prior_diagnostic_study_emg_details
    (self.prior_diagnostic_study_emg || "").split("--")
  end
end
