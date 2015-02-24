class SetDefaultsToDataQualities < ActiveRecord::Migration
  def self.up
    change_column_default(:data_qualities,:manufacturing,"illustrative")
    change_column_default(:data_qualities,:distribution,"illustrative")
    change_column_default(:data_qualities,:use,"illustrative")
    change_column_default(:data_qualities,:end_of_life,"illustrative")    
  end

  def self.down
    # You can't currently remove default values in Rails
    #raise ActiveRecord::IrreversibleMigration, "Can't remove the default"
  end
end
