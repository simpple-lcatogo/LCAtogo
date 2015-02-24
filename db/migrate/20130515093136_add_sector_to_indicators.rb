class AddSectorToIndicators < ActiveRecord::Migration
  def self.up
    add_column :indicators, :sector, :string
  end

  def self.down
    remove_column :indicators, :sector
  end
end
