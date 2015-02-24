class ChangeMtAssessmentMtProductTypeId < ActiveRecord::Migration
  def self.up
    remove_column :mt_assessments, :mt_product_type_id   
    add_column :mt_assessments, :product_type, :string    
  end

  def self.down
    remove_column :mt_assessments, :product_type    
    add_column :mt_assessments, :mt_product_type_id, :integer      
  end
end
