class SetAdminUsers < ActiveRecord::Migration
  def self.up
    user_1 = User.find(1)
    if user_1
      user_1.admin = true
      user_1.save
    end
  end

  def self.down
  end
end
