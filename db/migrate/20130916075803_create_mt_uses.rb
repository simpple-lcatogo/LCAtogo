class CreateMtUses < ActiveRecord::Migration
  def self.up
    create_table :mt_uses do |t|
      t.integer :mt_product_id
      t.float :processing
      t.float :ready
      t.float :standby
      t.float :working_days
      t.float :parts_produced
      t.string :description
      t.float :shifts_day
      t.float :hours_shift_processing
      t.float :hours_shift_ready
      t.float :hours_shift_standby
      t.integer :mt_energy_process_id

      t.timestamps
    end
  end

  def self.down
    drop_table :mt_uses
  end
end
