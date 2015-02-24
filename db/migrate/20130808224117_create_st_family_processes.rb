class CreateStFamilyProcesses < ActiveRecord::Migration
  def self.up
    create_table :st_family_processes do |t|
      t.string :name

      t.timestamps
    end
    StFamilyProcess.create_translation_table! :name => :string
  end

  def self.down
    drop_table :st_family_processes
    StFamilyProcess.drop_translation_table!
  end
end
