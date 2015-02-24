class CreateSeCountryInfos < ActiveRecord::Migration
  def self.up
    create_table :se_country_infos do |t|
      t.string :name
      t.float :electricity

      t.timestamps
    end
  end

  def self.down
    drop_table :se_country_infos
  end
end
