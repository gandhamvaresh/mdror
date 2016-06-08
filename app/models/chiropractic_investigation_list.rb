class ChiropracticInvestigationList < ActiveRecord::Base
  belongs_to :chiropractic_examination
  before_create :default_values

  def default_values
    self.dtr_biceps_left  = '2+'           #will set the default value only if it's nil
    self.dtr_biceps_right  = '2+'           #will set the default value only if it's nil
    self.dtr_pronator_right = '2+'
    self.dtr_pronator_left = '2+'
    self.dtr_triceps_right = '2+'
    self.dtr_triceps_left = '2+'
    self.dtr_patella_right = '2+'
    self.dtr_patella_left = '2+'
    self.dtr_achilles_right = '2+'
    self.dtr_achilles_left = '2+'
  end
  
  def grip_strength_entered?
    grip_strength_dyn1_right || rip_strength_dyn1_left || grip_strength_dyn2_right || rip_strength_dyn2_left || grip_strength_dyn3_right || rip_strength_dyn3_left
  end
end