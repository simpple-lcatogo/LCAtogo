class CreatePcCountryInfos < ActiveRecord::Migration
  def self.up
    create_table :pc_country_infos do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :pc_country_infos
  end
end
