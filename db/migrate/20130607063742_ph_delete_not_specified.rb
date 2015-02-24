class PhDeleteNotSpecified < ActiveRecord::Migration
  def self.up
     ph_module_type = PhModuleType.find_by_name('Not Specified')
     if ph_module_type
       ph_module_type.delete
     end
  end

  def self.down
     PhModuleType.create(:name => 'Not Specified', :efficiency => 0.0, :lifetime => 0.0, :records => 0.0)    
  end
end
