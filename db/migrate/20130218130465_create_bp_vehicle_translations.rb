class CreateBpVehicleTranslations < ActiveRecord::Migration
  def self.up
    BpVehicle.create_translation_table! :name => :string
  end

  def self.down
    BpVehicle.drop_translation_table!
  end
end
