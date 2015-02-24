class AddCommentToBpPackagingData < ActiveRecord::Migration
  def self.up
    add_column :bp_packaging_datas, :comment, :string    
  end

  def self.down
    remove_column :bp_packaging_datas, :comment
  end
end
