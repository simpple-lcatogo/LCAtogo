class AddSectorToIon < ActiveRecord::Migration
  def self.up
    bio_sector = Sector.find_by_name('bio_based')
    
    user_new = User.find_by_email('ion@valsay.com')
    if user_new       
      user_new.sectors << bio_sector
      user_new.save    
    end    
  end

  def self.down
  end
end
