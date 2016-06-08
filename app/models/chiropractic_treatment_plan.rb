class ChiropracticTreatmentPlan < ActiveRecord::Base
  belongs_to :chiropractic_examination
  
  def modality_prescribed?
    ultrasound || electric_stimulation || massage || mfr_cervical || mfr_thoracic || mfr_lumbar || mechanical_traction || other_therapeutic_modality
  end
end
