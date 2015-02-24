class AddCommentToBpTransportToConverterDatas < ActiveRecord::Migration
  def self.up
  	add_column :bp_transport_to_converter_datas, :comment, :string
  end

  def self.down
  	remove_column :bp_transport_to_converter_datas, :comment, :string
  end
end
