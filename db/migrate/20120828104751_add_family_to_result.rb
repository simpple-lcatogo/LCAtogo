class AddFamilyToResult < ActiveRecord::Migration
  def self.up
    add_column :results, :family_id, :integer
  end

  def self.down
    remove_column :results, :family_id
  end
end
