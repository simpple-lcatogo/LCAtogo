class CreatePhCountryInfos < ActiveRecord::Migration
  def self.up
    create_table :ph_country_infos do |t|
      t.string :name
      t.float :co2
      t.float :mg
      t.float :poly
      t.float :wafers
      t.float :cells
      t.float :modules
      t.float :cdte
      t.float :cigs

      t.timestamps
    end
  end

  def self.down
    drop_table :ph_country_infos
  end
end
