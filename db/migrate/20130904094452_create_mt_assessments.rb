class CreateMtAssessments < ActiveRecord::Migration
  def self.up
    create_table :mt_assessments do |t|
      t.integer :mt_product_id
      t.integer :mt_product_type_id
      t.float :weight
      t.float :lifetime
      t.string :assessment_type

      t.timestamps
    end
  end

  def self.down
    drop_table :mt_assessments
  end
end
