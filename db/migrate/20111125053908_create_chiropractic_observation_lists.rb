class CreateChiropracticObservationLists < ActiveRecord::Migration
  def change
    create_table :chiropractic_observation_lists do |t|
      t.boolean :myospasms
      t.boolean :tenderness
      t.boolean :hypotonicity
      t.boolean :flare_ups
      t.boolean :suboccipitals
      t.boolean :rhomboids
      t.boolean :deltoids
      t.boolean :quad_lumb
      t.boolean :uppertraps
      t.boolean :levator_scap
      t.boolean :ctl_paraspinals
      t.string :other_observations
      t.boolean :disc_c1
      t.boolean :disc_c2
      t.boolean :disc_c3
      t.boolean :disc_c4
      t.boolean :disc_c5
      t.boolean :disc_c6
      t.boolean :disc_c7
      t.boolean :disc_t1
      t.boolean :disc_t2
      t.boolean :disc_t3
      t.boolean :disc_t4
      t.boolean :disc_t5
      t.boolean :disc_t6
      t.boolean :disc_t7
      t.boolean :disc_t8
      t.boolean :disc_t9
      t.boolean :disc_t10
      t.boolean :disc_t11
      t.boolean :disc_t12
      t.boolean :disc_l1
      t.boolean :disc_l2
      t.boolean :disc_l3
      t.boolean :disc_l4
      t.boolean :disc_l5
      t.boolean :occiput
      t.boolean :sacrum
      t.boolean :sacroiliac_left
      t.boolean :sacroiliac_right

      t.timestamps
      t.datetime :deleted_at
      
      # Foreign keys
      t.integer :chiropractic_treatment_id
    end
  end
end
