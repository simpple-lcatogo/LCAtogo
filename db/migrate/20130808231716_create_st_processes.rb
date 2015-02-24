class CreateStProcesses < ActiveRecord::Migration
  def self.up
    create_table :st_processes do |t|
      t.string :name
      t.references :st_family_process
      t.string :unit

      t.timestamps
    end
    StProcess.create_translation_table! :name => :string
  end

  def self.down
    drop_table :st_processes
    StProcess.drop_translation_table!
  end
end
