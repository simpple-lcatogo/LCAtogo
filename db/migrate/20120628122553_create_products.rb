class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :organisation
      t.string :person_name
      t.string :name
      t.string :version
      t.text :description
      t.string :sector
      t.string :language
      t.boolean :assessment
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
