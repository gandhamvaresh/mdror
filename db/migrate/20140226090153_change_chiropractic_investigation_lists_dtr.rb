class ChangeChiropracticInvestigationListsDtr < ActiveRecord::Migration
  def up
      change_table :chiropractic_investigation_lists do |t|
        t.change :dtr_biceps_right, :string
        t.change :dtr_biceps_left, :string
        t.change :dtr_pronator_right, :string
        t.change :dtr_pronator_left, :string
        t.change :dtr_triceps_right, :string
        t.change :dtr_triceps_left, :string
        t.change :dtr_patella_right, :string
        t.change :dtr_patella_left, :string
        t.change :dtr_achilles_right, :string
        t.change :dtr_achilles_left, :string
        
        t.change :grip_strength_dyn1_right, :string
        t.change :rip_strength_dyn1_left, :string
        t.change :grip_strength_dyn2_right, :string
        t.change :rip_strength_dyn2_left, :string
        t.change :grip_strength_dyn3_right, :string
        t.change :rip_strength_dyn3_left, :string
      end
    end

    def down
      change_table :chiropractic_investigation_lists do |t|
        t.change :dtr_biceps_right, :integer
        t.change :dtr_biceps_left, :integer
        t.change :dtr_pronator_right, :integer
        t.change :dtr_pronator_left, :integer
        t.change :dtr_triceps_right, :integer
        t.change :dtr_triceps_left, :integer
        t.change :dtr_patella_right, :integer
        t.change :dtr_patella_left, :integer
        t.change :dtr_achilles_right, :integer
        t.change :dtr_achilles_left, :integer
        
        t.change :grip_strength_dyn1_right, :integer
        t.change :rip_strength_dyn1_left, :integer
        t.change :grip_strength_dyn2_right, :integer
        t.change :rip_strength_dyn2_left, :integer
        t.change :grip_strength_dyn3_right, :integer
        t.change :rip_strength_dyn3_left, :integer
      end
    end
end
