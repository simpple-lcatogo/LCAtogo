class CreateBpCompoundFamilies < ActiveRecord::Migration
  def self.up
    create_table :bp_compound_families do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :bp_compound_families
  end
end
