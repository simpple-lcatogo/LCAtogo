class CreateBpDataQualities < ActiveRecord::Migration
  def self.up
    create_table :bp_data_qualities do |t|
      t.integer :bp_product_id
      t.string :reliability
      t.string :completeness
      t.string :temporal
      t.string :geographical
      t.string :technological

      t.timestamps
    end
  end

  def self.down
    drop_table :bp_data_qualities
  end
end
