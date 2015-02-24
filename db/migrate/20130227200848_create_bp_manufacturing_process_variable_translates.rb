class CreateBpManufacturingProcessVariableTranslates < ActiveRecord::Migration
  def self.up
    BpManufacturingProcessVariable.create_translation_table! :name => :string
  end

  def self.down
    BpManufacturingProcessVariable.drop_translation_table!
  end
end
