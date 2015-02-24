class AddStageToFamily < ActiveRecord::Migration
  def self.up
    add_column :families, :stage, :string  
  end

  def self.down
    remove_column :families, :stage
  end
end
