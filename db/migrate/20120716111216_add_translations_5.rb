class AddTranslations5 < ActiveRecord::Migration
  def self.up
    EconomicalPhase.create_translation_table! :name => :string
    EconomicalFamily.create_translation_table! :name => :string
    EconomicalFlow.create_translation_table! :name => :string    
  end

  def self.down
    EconomicalPhase.drop_translation_table!
    EconomicalFamily.drop_translation_table!    
    EconomicalFlow.drop_translation_table!
  end
end
