class AddCommentsToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :kepi_explanation, :text
    add_column :products, :comparison_comments, :text
    add_column :products, :production_comments, :text
    add_column :products, :use_comments, :text    
  end

  def self.down
    remove_column :products, :kepi_explanation
    remove_column :products, :comparison_comments
    remove_column :products, :production_comments
    remove_column :products, :use_comments    
  end
end
