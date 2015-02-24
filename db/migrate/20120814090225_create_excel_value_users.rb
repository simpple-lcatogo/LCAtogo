class CreateExcelValueUsers < ActiveRecord::Migration
  def self.up
    create_table :excel_value_users do |t|
      t.integer :excel_value_id
      t.integer :user_id
      t.float :value

      t.timestamps
    end
  end

  def self.down
    drop_table :excel_value_users
  end
end
