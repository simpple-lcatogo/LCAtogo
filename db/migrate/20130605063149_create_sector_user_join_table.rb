class CreateSectorUserJoinTable < ActiveRecord::Migration
  def self.up
    create_table :sectors_users, :id => false do |t|
      t.integer :sector_id      
      t.integer :user_id
    end      
  end

  def self.down
    drop_table :sectors_users
  end
end
