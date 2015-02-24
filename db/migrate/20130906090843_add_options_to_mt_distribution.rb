class AddOptionsToMtDistribution < ActiveRecord::Migration
  def self.up
    remove_column :mt_distributions, :overland    
    remove_column :mt_distributions, :overseas    
    add_column :mt_distributions, :options, :string      
  end

  def self.down
    add_column :mt_distributions, :overland, :boolean
    add_column :mt_distributions, :overseas, :boolean
    remove_column :mt_distributions, :options    
  end
end
