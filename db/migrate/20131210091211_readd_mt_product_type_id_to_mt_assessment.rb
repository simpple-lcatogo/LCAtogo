class ReaddMtProductTypeIdToMtAssessment < ActiveRecord::Migration
  def self.up
    add_column :mt_assessments, :mt_product_type_id, :integer
  end

  def self.down
    remove_column :mt_assessments, :mt_product_type_id 
  end
end
