class ChangeBpCommentStringToText < ActiveRecord::Migration
  def self.up
  	change_column :bp_manufacturing_datas, :comment, :text
  	change_column :bp_transport_to_converter_datas, :comment, :text
  	change_column :bp_transport_to_customer_datas, :comment, :text
  	change_column :bp_manufacturing_datas, :comment, :text
  end

  def self.down
  	change_column :bp_manufacturing_datas, :comment, :string
  	change_column :bp_transport_to_converter_datas, :comment, :string
  	change_column :bp_transport_to_customer_datas, :comment, :string
  	change_column :bp_manufacturing_datas, :comment, :string
  end
end
