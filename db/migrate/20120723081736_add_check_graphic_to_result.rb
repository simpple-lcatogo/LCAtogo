class AddCheckGraphicToResult < ActiveRecord::Migration
  def self.up
    add_column :results, :check_graphic, :boolean
  end

  def self.down
    remove_column :results, :check_graphic
  end
end
