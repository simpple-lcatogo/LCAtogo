class AddBpCompoundMaterialFake < ActiveRecord::Migration
  def self.up
       BpCompoundMaterial.create(:name => 'Master-batch', :based_type => 'fake_economic')
  end

  def self.down
  end
end
